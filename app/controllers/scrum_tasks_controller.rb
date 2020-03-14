class ScrumTasksController < ApplicationController
  before_action :set_scrum_task, only: [:show, :edit, :update, :destroy]

  helper_method :complete_task

  

  # GET /scrum_tasks
  # GET /scrum_tasks.json
  def index
    @scrum_tasks = ScrumTask.all
  end

  # GET /scrum_tasks/1
  # GET /scrum_tasks/1.json
  def show
  end

  # GET /scrum_tasks/new
  def new
    @scrum_task = ScrumTask.new
    task_pd = params[:task_recurrences_id]
    repeat_pd = params[:repeat_recurrences_id]
    @task_recurrence = TaskRecurrence.where('id = ?', task_pd).map{|c| [ c.name, c.id ] } #only show recurrence based on which 'add' button was clicked
    @repeat_recurrence = TaskRecurrence.all.map{|c| [ c.name, c.id ] }
    
    @project_umbrellas = ProjectUmbrella.all
    @projects = Project.all
    @project_modules = ProjectModule.all

    respond_to do |format|
      format.html
      format.js
    end
    #respond_modal_with @scrum_task
  end

  def new_inherited_task
    weekly_goal = ScrumTask.find(params[:weekly_goal])
    @scrum_task = ScrumTask.new
    @project_umbrella = ProjectUmbrella.find(weekly_goal.project_umbrella_id)
    @project = Project.find(weekly_goal.project_id)
    @project_module = ProjectModule.find(weekly_goal.project_module_id)

    respond_to do |format|
      format.json
      format.html
      format.js
    end
  end

  # GET /scrum_tasks/1/edit
  def edit
    @scrum_task = ScrumTask.find(params[:id])
    @task_recurrence = TaskRecurrence.find(@scrum_task.task_recurrences_id)
    @repeat_recurrence = TaskRecurrence.all.map{|c| [ c.name, c.id ] }
    @projects = Project.all
    @project_modules = ProjectModule.all
    @project_umbrellas = ProjectUmbrella.all

    respond_to do |format|
      format.json
      format.html
      format.js
    end
  end

  def mark_today_task
    @scrum_task = ScrumTask.find(params[:scrum_task])
    respond_to do |format|
      if @scrum_task.update(is_daily_task: true)
        format.html { redirect_to '/', notice: 'Scrum task was successfully updated.' }
        format.json #{ render @trackers, status: :ok }
      else
        format.html { render :edit }
        format.json { render json: @scrum_task.errors, status: :unprocessable_entity }
      end
    end
  end

  def remove_today_task
    @scrum_task = ScrumTask.find(params[:scrum_task])
    respond_to do |format|
      if @scrum_task.update(is_daily_task: false)
        format.html { redirect_to '/', notice: 'Scrum task was successfully updated.' }
        format.json #{ render @trackers, status: :ok }
      else
        format.html { render :edit }
        format.json { render json: @scrum_task.errors, status: :unprocessable_entity }
      end
    end
  end

  # POST /scrum_tasks
  # POST /scrum_tasks.json
  def create
    @scrum_task = ScrumTask.new(scrum_task_params)
    @scrum_task.populate_ids #default the month number from the date into the month column
    
    respond_to do |format|
      if @scrum_task.save
        format.html { redirect_to '/', notice: 'Scrum task was successfully created.' }
        format.json #{ render :show, status: :created, location: @scrum_task }
      else
        format.html { render :new }
        format.json { render json: @scrum_task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /scrum_tasks/1
  # PATCH/PUT /scrum_tasks/1.json
  def update
     respond_to do |format|
       if @scrum_task.update(scrum_task_params)
          format.html { redirect_to '/', notice: 'Scrum task was successfully updated.' }
         format.json #{ render @trackers, status: :ok }
       else
         format.html { render :edit }
         format.json { render json: @scrum_task.errors, status: :unprocessable_entity }
       end
     end
  end



  # DELETE /scrum_tasks/1
  # DELETE /scrum_tasks/1.json
  def destroy
    @scrum_task.destroy
    respond_to do |format|
      format.html { redirect_to '/', notice: 'Scrum task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def delete_task
    @scrum_task = ScrumTask.find(params[:scrum_task])
    @scrum_task.destroy
    respond_to do |format|
      format.html { redirect_to '/', notice: 'Scrum task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  #CRON JOBS
  def nightly_task_processing 
    completed_tasks = ScrumTask.where('completed = ?', true) #limit array to only completed tasks

    completed_tasks.each do |task| 
      if task.repeat_recurrences_id == 1 
        ScrumTask.update(task.id, :completed => false)
      else 
        ScrumTask.update(task.id, :active => false) #flag the task as inactive
      end
    end
    respond_to do |format|
      format.html { redirect_to '/', notice: 'NT Process Complete.' }
      format.json 
    end
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_scrum_task
      @scrum_task = ScrumTask.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def scrum_task_params
      params.require(:scrum_task).permit(:task_recurrences_id, :name, :completed, :repeat_recurrences_id, :active, :project_id, :project_module_id, :project_umbrella_id, :is_today_task)
    end

  end
