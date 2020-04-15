class DailyTasksController < ApplicationController
  before_action :set_daily_task, only: [:show, :edit, :update, :destroy]

  helper_method :complete_task

  

  # GET /daily_tasks
  # GET /daily_tasks.json
  def index
    @daily_tasks = DailyTask.all
  end

  # GET /daily_tasks/1
  # GET /daily_tasks/1.json
  def show
  end

  # GET /daily_tasks/new
  def new
    @daily_task = DailyTask.new
    @repeat_recurrence = RepeatRecurrence.all.map{|c| [ c.name, c.id ] }

    respond_to do |format|
      format.html
      format.js
    end
  end

  # GET /daily_tasks/1/edit
  def edit
    @daily_task = DailyTask.find(params[:id])

    respond_to do |format|
      format.json
      format.html
      format.js
    end
  end

  def mark_today_task
    @daily_task = DailyTask.find(params[:task_id])
    respond_to do |format|
      if @daily_task.update(is_today_task: true)
        format.html { redirect_to '/', notice: 'Daily Task was successfully updated.' }
        format.json #{ render @trackers, status: :ok }
      else
        format.html { render :edit }
        format.json { render json: @daily_task.errors, status: :unprocessable_entity }
      end
    end
  end

  def remove_today_task
    @daily_task = DailyTask.find(params[:task_id])
    respond_to do |format|
      if @daily_task.update(is_today_task: false)
        format.html { redirect_to '/', notice: 'Daily Task was successfully updated.' }
        format.json #{ render @trackers, status: :ok }
      else
        format.html { render :edit }
        format.json { render json: @daily_task.errors, status: :unprocessable_entity }
      end
    end
  end

  # POST /daily_tasks
  # POST /daily_tasks.json
  def create
    @daily_task = DailyTask.new(daily_task_params)
    @daily_task.populate_ids #default the month number from the date into the month column
    
    respond_to do |format|
      if @daily_task.save
        format.html { redirect_to '/', notice: 'Daily Task was successfully created.' }
        format.json #{ render :show, status: :created, location: @daily_task }
      else
        format.html { render :new }
        format.json { render json: @daily_task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /daily_tasks/1
  # PATCH/PUT /daily_tasks/1.json
  def update
     respond_to do |format|
       if @daily_task.update(daily_task_params)
          format.html { redirect_to '/', notice: 'Daily Task was successfully updated.' }
         format.json #{ render @trackers, status: :ok }
       else
         format.html { render :edit }
         format.json { render json: @daily_task.errors, status: :unprocessable_entity }
       end
     end
  end

  def complete_task
    @daily_task = DailyTask.find(params[:task_id])
    @daily_task.update_attribute(:completed,true)
    respond_to do |format|
      format.html { redirect_to request.referer, notice: 'Daily Task was successfully completed.' }
      format.json { head :no_content }
    end
  end

  # DELETE /daily_tasks/1
  # DELETE /daily_tasks/1.json
  def destroy
    @daily_task.destroy
    respond_to do |format|
      format.html { redirect_to '/', notice: 'Daily Task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def delete_task
    @daily_task = DailyTask.find(params[:task_id])
    @daily_task.destroy
    respond_to do |format|
      format.html { redirect_to '/', notice: 'Daily Task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  #CRON JOBS
  def nightly_task_processing 
    completed_tasks = DailyTask.where('completed = ?', true) #limit array to only completed tasks
    completed_goals = WeeklyGoal.where('completed = ?', true)

    completed_tasks.each do |daily_task| 
      if daily_task.repeat_recurrence_id == 1 
        DailyTask.update(daily_task.id, :completed => false)
      else 
        DailyTask.update(daily_task.id, :active => false) #flag the task as inactive
      end
    end

    completed_goals.each do |weekly_goal| 
      if weekly_goal.repeat_recurrence_id == 1 
        WeeklyGoal.update(weekly_goal.id, :completed => false)
      else 
        WeeklyGoal.update(weekly_goal.id, :active => false) #flag the task as inactive
      end
    end

    respond_to do |format|
      format.html { redirect_to '/', notice: 'NT Process Complete.' }
      format.json 
    end
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_daily_task
      @daily_task = DailyTask.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def daily_task_params
      params.require(:daily_task).permit(:name, :completed, :repeat_recurrence_id, :active, :project_id, :weekly_goal_id, :project_umbrella_id, :is_today_task)
    end

  end
