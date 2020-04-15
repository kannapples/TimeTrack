class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  # GET /projects
  # GET /projects.json
  def index
    @projects = Project.all

    #PROJECT UMBRELLAS
    @project_umbrellas = ProjectUmbrella.all

    #WEEKLY GOALS
    @weekly_goals = WeeklyGoal.all
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
  end

  # GET /projects/new
  def new
    @project = Project.new
    if !params[:project_umbrella_id].nil? then
      @project_umbrella = ProjectUmbrella.find(params[:project_umbrella_id]) #if project_umbrella was passed in from project umbrella create function
    end
  end

  # GET /projects/1/edit
  def edit
    @project_umbrellas = ProjectUmbrella.all
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(project_params)

    respond_to do |format|
      if @project.save
        # When a new project is created, its most likely because you also want to create a new weekly goal under that project. Redirect to Weekly Goal Creation Page to save clicks.
        format.html { redirect_to new_weekly_goal_path(:project_id => @project.id, :project_umbrella_id => @project.project_umbrella_id), notice: 'Project umbrella was successfully created.' }
        
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to projects_url, notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end


  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    if @project.children? #warn user about deleting project umbrella with associated projects
        project_id = @project.id.to_s
        assoc_wgs = @project.get_children_string
        
        respond_to do |format|
          format.html
          format.js { render :js => "delete_p_children("+project_id+","+assoc_wgs+");" } #confirmation window about whether to delete all children
        end
   
    else
      @project.destroy
      respond_to do |format|
        format.html { redirect_to projects_url, notice: 'Project was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  end

  def delete_project_and_wgs
      project = Project.find(params[:project_id]) #find project based on ajax call parameter
      assoc_wgs = project.get_children # get all associated weekly goals
      WeeklyGoal.destroy(assoc_wgs.map(&:id)) #destroy all associated projects

      project.destroy #destroy project umbrella

      respond_to do |format|
        format.html { redirect_to projects_url, notice: 'Project was successfully destroyed.' }
        format.json { head :no_content }
      end
  end



  #PROJECT UMBRELLA METHODS
  # GET /project/umbrella/new
  def new_project_umbrella
    @project_umbrella = ProjectUmbrella.new
  end

  ##############################################################################################

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:name, :start_date, :completion_goal_date, :project_umbrella_id, :weekly_goals)
    end
end
