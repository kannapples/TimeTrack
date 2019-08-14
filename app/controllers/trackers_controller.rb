class TrackersController < ApplicationController
  before_action :set_tracker, only: [:show, :edit, :update, :destroy]

  helper_method :get_prev_month_year, :get_days_trackers, :get_weekly_goals, :get_daily_tasks


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
      # @trackers = Tracker.where("month = ? AND CAST(strftime('%Y',date) AS integer) = ?",@month, @year).all.order("date DESC")

      #SCRUM TASKS
      @weekly_goal_categories = ScrumTask.where("task_recurrences_id = ?","2").group(:category).pluck(:category)
      @daily_task_categories = ScrumTask.where("task_recurrences_id = ?","1").group(:category).pluck(:category)


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
    @tracker = Tracker.new
  end

  # GET /trackers/1/edit
  def edit #edit button skips this because of remote:true in index.html, which takes you straight to edit.js.erb
  end

  def edit_track
    #@tracker = Tracker.find(params[:id])
    # respond_to do |format|
    #   format.js
    # end
  end

  # POST /trackers
  # POST /trackers.json
  def create
    @tracker = Tracker.new(tracker_params)

    respond_to do |format|
      format.html 
      format.js 
      if @tracker.save
        format.html { redirect_to @tracker, notice: 'Tracker was successfully created.' }
        format.json { render :show, status: :created, location: @tracker }
      else
        format.html { render :new }
        format.json { render json: @tracker.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trackers/1
  # PATCH/PUT /trackers/1.json
  def update
    respond_to do |format|
      if @tracker.update(tracker_params)
        format.html { redirect_to @tracker, notice: 'Tracker was successfully updated.' }
        format.json { render :show, status: :ok, location: @tracker }
      else
        format.html { render :edit }
        format.json { render json: @tracker.errors, status: :unprocessable_entity }
      end
    end
  end

  def update_tracker
    respond_to do |format|
      format.js
      if @tracker.save
        format.html { redirect_to @tracker, notice: 'Tracker updated.' }
        format.json { render :show, status: :ok, location: @tracker }
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
      format.html { redirect_to trackers_url, notice: 'Tracker was successfully destroyed.' }
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
      @day_trackers = Tracker.where("CAST(strftime('%Y',date) AS integer) = ? AND month = ? AND CAST(strftime('%d',date) AS integer) = ?",@year,@month, i).all.order("date DESC")
    end

  #########################################################################
  ####                 HELPER METHODS FOR SCRUM TASKS                  ####
  #########################################################################

    def get_weekly_goals category
      return ScrumTask.where("task_recurrences_id = ? AND category = ?","2",category).all
    end

    def get_daily_tasks category
      return ScrumTask.where("task_recurrences_id = ? AND category = ?","1",category).all
    end

  #########################################################################
  ####                      TRACKER PARAM SIEVE                        ####
  #########################################################################

    # Never trust parameters from the scary internet, only allow the white list through.
    def tracker_params
      params.require(:tracker).permit(:date, :task, :subtask_1, :subtask_2, :hours, :start_time, :end_time, :payment, :month)
    end
end
