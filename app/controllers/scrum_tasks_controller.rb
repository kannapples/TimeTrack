class ScrumTasksController < ApplicationController
  before_action :set_scrum_task, only: [:show, :edit, :update, :destroy]

  

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

    respond_to do |format|
      format.html
      format.js

  end

    #respond_modal_with @scrum_task
  end

  # GET /scrum_tasks/1/edit
  def edit
    @task_recurrence = TaskRecurrence.all.map{|c| [ c.name, c.id ] }
    @repeat_recurrence = TaskRecurrence.all.map{|c| [ c.name, c.id ] }

    respond_to do |format|
      format.html
      format.js
    end
  end

  # POST /scrum_tasks
  # POST /scrum_tasks.json
  def create
    @scrum_task = ScrumTask.new(scrum_task_params)

    respond_to do |format|
      if @scrum_task.save
        format.html { redirect_to @scrum_task, notice: 'Scrum task was successfully created.' }
        format.json { render :show, status: :created, location: @scrum_task }
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

  def complete_task
    @scrum_task = ScrumTask.find(params[:scrum_task])
    if @scrum_task.update_attribute(:completed,true)
      redirect_back(fallback_location: root_path)
    end
  end

  # DELETE /scrum_tasks/1
  # DELETE /scrum_tasks/1.json
  def destroy
    @scrum_task.destroy
    respond_to do |format|
      format.html { redirect_to scrum_tasks_url, notice: 'Scrum task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_scrum_task
      @scrum_task = ScrumTask.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def scrum_task_params
      params.require(:scrum_task).permit(:task_recurrences_id, :category, :task, :completed, :repeat_recurrences_id)
    end
end
