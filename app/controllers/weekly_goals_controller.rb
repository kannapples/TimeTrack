class WeeklyGoalsController < ApplicationController
  before_action :set_weekly_goal, only: [:show, :edit, :update, :destroy]

  # GET /weekly_goals
  # GET /weekly_goals.json
  def index
    @weekly_goals = WeeklyGoal.all
  end
 
  # GET /weekly_goals/1
  # GET /weekly_goals/1.json
  def show
  end

  # GET /weekly_goals/new
  def new
    @weekly_goal = WeeklyGoal.new
    if !params[:project_umbrella_id].nil? then
      @project_umbrella = ProjectUmbrella.find(params[:project_umbrella_id]) #if project_umbrella was passed in from project create function
    end
    if !params[:project_id].nil? then
      @project = Project.find(params[:project_id]) #if project was passed in from project create function
    end

    respond_to do |format|
      format.html 
      format.js
    end
  end

  def new_inherited_task
    @weekly_goal = WeeklyGoal.find(params[:weekly_goal])
    @daily_task = DailyTask.new
    @project_umbrella = ProjectUmbrella.find(@weekly_goal.project_umbrella_id)
    @project = Project.find(@weekly_goal.project_id)

    respond_to do |format|
      format.json
      format.html
      format.js
    end
  end

  # GET /weekly_goals/1/edit
  def edit
    @weekly_goal = WeeklyGoal.find(params[:id])

    respond_to do |format|
      format.json
      format.html
      format.js
    end
  end

  # POST /weekly_goals
  # POST /weekly_goals.json
  def create
    @weekly_goal = WeeklyGoal.new(weekly_goal_params)

    respond_to do |format|
      if @weekly_goal.save
        format.html
        #format.html { redirect_to request.referer, notice: 'Weekly Goal was successfully created.' } #refresh page where 'new' button was clicked
        format.json { render :show, status: :created, location: @weekly_goal }
      else
        format.html { render :new }
        format.json { render json: @weekly_goal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /weekly_goals/1
  # PATCH/PUT /weekly_goals/1.json
  def update
    respond_to do |format|
      if @weekly_goal.update(weekly_goal_params)
        format.html { redirect_to request.referer, notice: 'Weekly Goal was successfully updated.' }
        format.json { render :show, status: :ok, location: @weekly_goal }
      else
        format.html { render :edit }
        format.json { render json: @weekly_goal.errors, status: :unprocessable_entity }
      end
    end
  end

  def complete_goal
    @weekly_goal = weekly_goal.find(params[:goal_id])
    @weekly_goal.update_attribute(:completed,true)
    respond_to do |format|
      format.html { redirect_to '/', notice: 'Weekly Goal was successfully completed.' }
      format.json { head :no_content }
    end
  end

  def delete_goal
    @weekly_goal = WeeklyGoal.find(params[:goal_id])
    @weekly_goal.destroy
    respond_to do |format|
      format.html { redirect_to '/', notice: 'Weekly Goal was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # DELETE /weekly_goals/1
  # DELETE /weekly_goals/1.json
  def destroy
    @weekly_goal.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Weekly Goal was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_weekly_goal
      @weekly_goal = WeeklyGoal.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def weekly_goal_params
      params.require(:weekly_goal).permit(:name, :project_id, :completed, :repeat_recurrence_id, :active, :project_umbrella_id)
    end
end
