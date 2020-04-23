class TrackersController < ApplicationController
  before_action :set_tracker, only: [:show, :edit, :update, :destroy]

  helper_method :get_prev_month_year, :get_days_trackers, :get_outstanding_weekly_goals, :get_completed_weekly_goals, :get_daily_tasks, :get_unassoc_daily_tasks, :new_daily_task_initialize, :complete_task, :get_todays_outstanding_tasks, :get_todays_completed_tasks


  # GET /trackers
  # GET /trackers.json
  #limit to only trackers within the specified month, ordered with most recent date first
  def index

    #TRACKERS
    month=params[:month]
    year=params[:year]
      if month.nil? or year.nil? then 
        @month=Time.now.month 
        @year=Time.now.year
      else 
        @month=month.to_i
        @year=year.to_i
      end

      #WEEKLY GOALS
      # => Group Weekly Goals by Project Umbrella for grouped display in index
      @weekly_goal_categories = ProjectUmbrella.joins(:projects => [:weekly_goals]).pluck(:name).uniq #avoid duplicates

      #PROJECT INFRASTRUCTURE
      @projects = Project.all 
      @weekly_goals = WeeklyGoal.all 
      @daily_tasks = DailyTask.all 


  end

  def month_index
    month=params[:month]
    year=params[:year]
      if month.nil? or year.nil? then 
        @month=Time.now.month 
        @year=Time.now.year
      else 
        @month=month.to_i
        @year=year.to_i
      end
  end

  # GET /trackers/1
  # GET /trackers/1.json
  def show
  end

  # GET /trackers/new
  def new
    #initialize globals
    @tracker = Tracker.new
    @projects = Project.all 
    @weekly_goals = WeeklyGoal.all 
    @daily_tasks = DailyTask.all 
  end

  # GET /trackers/1/edit
  def edit 
    #initialize globals
      @tracker = Tracker.find(params[:id])
      @projects = Project.all 
      @weekly_goals = WeeklyGoal.all 
      @daily_tasks = DailyTask.all 

      respond_to do |format|
        format.js 
        format.html { redirect_to '/', notice: 'Tracker was successfully updated.' }
        format.json
      end

  end

  # POST /trackers
  # POST /trackers.json
  def create
    @tracker = Tracker.new(tracker_params)
    @tracker.update_month #default the month number from the date into the month column

    respond_to do |format|
      if @tracker.save
        format.js
        format.html { redirect_to '/', notice: 'Tracker was successfully created.' }
        format.json #{ render :show, status: :created, location: @tracker }
      else
        format.js
        format.html { render :new }
        format.json { render json: @tracker.errors, status: :unprocessable_entity }
      end
    end
  end

  def create_task_tracker

    @task = DailyTask.find(params[:task_id])

    respond_to do |format|
      format.json
      format.html
      format.js
    end
  end

  # PATCH/PUT /trackers/1
  # PATCH/PUT /trackers/1.json
  def update
    #PROJECT INFRASTRUCTURE
      @projects = Project.all 
      @weekly_goals = WeeklyGoal.all 
      @daily_tasks = DailyTask.all 

    respond_to do |format|
      if @tracker.update(tracker_params)
        format.html { redirect_to request.referer, notice: 'Tracker was successfully updated.' } #refresh page where 'edit' button was clicked
        format.json #{ render :show, status: :ok, location: @tracker }
      else
        format.html { render :edit }
        format.json { render json: @tracker.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trackers/1
  # DELETE /trackers/1.json
  def destroy
    @tracker.destroy
    respond_to do |format|
      format.html { redirect_to request.referer, notice: 'Tracker was successfully destroyed.' } #refresh page where 'edit' button was clicked
      format.json { head :no_content }
    end
  end


  def complete_task_from_tracker
    @daily_task.update_attribute(:completed,true)
    respond_to do |format|
      format.html { redirect_to '/', notice: 'Daily Task was successfully completed.' }
      format.json { head :no_content }
    end
  end


  private

  #########################################################################
  ####                   HELPER METHODS FOR TRACKERS                   ####
  #########################################################################
    # Use callbacks to share common setup or constraints between actions.
    def set_tracker
      @tracker = Tracker.find(params[:id])
    end

    def get_prev_month_year dir
      curr_month_year = Date.new(@year,@month,1)
      if dir=="-" then
        if curr_month_year.mon == 1 then
          incr_month = {"month" => (curr_month_year - 1.months).month, "year" => (curr_month_year - 1.years).year}
        else 
          incr_month = {"month" => (curr_month_year - 1.months).month, "year" => curr_month_year.year}
        end
      else 
        if curr_month_year.mon == 12 then
          incr_month = {"month" => (curr_month_year + 1.months).month, "year" => (curr_month_year + 1.years).year}
        else 
          incr_month = {"month" => (curr_month_year + 1.months).month, "year" => curr_month_year.year}
        end
      end
      return incr_month
    end


    def get_days_trackers i
      @day_trackers = Tracker.where("CAST(EXTRACT(YEAR FROM date) AS integer) = ? AND month = ? AND CAST(EXTRACT(DAY FROM date) AS integer) = ?",@year, @month, i).all.order("date DESC")
     # @day_trackers = Tracker.where("CAST(strftime('%Y',date) AS integer) = ? AND month = ? AND CAST(strftime('%d',date) AS integer) = ?",@year,@month, i).all.order("date DESC")
    end

  #########################################################################
  ####        HELPER METHODS FOR DAILY TASKS AND WEEKLY GOALS          ####
  #########################################################################

  #remember that join references the model, but where references the table
    def get_outstanding_weekly_goals 
      includesOutsDT = WeeklyGoal.where('weekly_goals.id IN (?)', DailyTask.where("completed = ? AND active = ?",false,true).select(:weekly_goal_id))
      return includesOutsDT.all.order('weekly_goals.project_umbrella_id DESC')
    end

    def get_completed_weekly_goals 
      excludesOutsDT = WeeklyGoal.where('weekly_goals.id NOT IN (?)', DailyTask.where("completed = ? AND active = ?",false,true).select(:weekly_goal_id))
      return excludesOutsDT.all.order('weekly_goals.project_umbrella_id DESC')
    end

    def get_daily_tasks wg_id 
      return DailyTask.where(:daily_tasks => {:active => true}).joins(:weekly_goal).where(:weekly_goals => {:id => wg_id}).all
      # return DailyTask.where(:daily_tasks => {:active => true}).joins(:weekly_goal => :project).where(:projects => {:id => project_id}).all
    end

    def get_todays_outstanding_tasks
      return DailyTask.where("is_today_task = ? AND active = ? AND completed = ?", true, true, false).all
    end

    def get_todays_completed_tasks
      return DailyTask.where("is_today_task = ? AND active = ? AND completed = ?", true, true, true).all
    end

    def get_unassoc_daily_tasks 
      # find daily tasks that do not have a weekly task that shares the same project
      unassoc_daily_tasks = []
      # loop through all daily tasks
      DailyTask.where("active = ?", true).each do |daily_task| 
        # if there is not weekly task associated with the same project, add to array
        unless WeeklyGoal.where("active = ? AND project_umbrella_id = ?", true, daily_task.project_umbrella_id).exists?
          unassoc_daily_tasks.push(daily_task)
        end
      end
      return unassoc_daily_tasks
    end

  #########################################################################
  ####                      TRACKER PARAM SIEVE                        ####
  #########################################################################

    # Never trust parameters from the scary internet, only allow the white list through.
    def tracker_params
      params.require(:tracker).permit(:date, :task, :subtask_1, :description, :hours, :start_time, :end_time, :payment, :month, :project_id, :weekly_goal_id, :daily_task_id, :project_umbrella_id, daily_task_attributes:[:completed])
    end
end
