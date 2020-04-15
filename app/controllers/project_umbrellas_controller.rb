class ProjectUmbrellasController < ApplicationController
  before_action :set_project_umbrella, only: [:show, :edit, :update, :destroy]

  # GET /project_umbrellas
  # GET /project_umbrellas.json
  def index
    @project_umbrellas = ProjectUmbrella.all
  end

  # GET /project_umbrellas/1
  # GET /project_umbrellas/1.json
  def show
  end

  # GET /project_umbrellas/new
  def new
    @project_umbrella = ProjectUmbrella.new
  end

  # GET /project_umbrellas/1/edit
  def edit
  end

  # POST /project_umbrellas
  # POST /project_umbrellas.json
  def create
    @project_umbrella = ProjectUmbrella.new(project_umbrella_params)

    respond_to do |format|
      if @project_umbrella.save
        # When a new project umbrella is created, its most likely because you also want to create a new project or task under that umbrella. Redirect to Project Creation Page to save clicks.
        format.html { redirect_to new_project_path(:project_umbrella_id => @project_umbrella.id), notice: 'Project umbrella was successfully created.' }
        format.json { render :new, status: :ok, location: @project } 
      else
        format.html { render :new }
        format.json { render json: @project_umbrella.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /project_umbrellas/1
  # PATCH/PUT /project_umbrellas/1.json
  def update
    respond_to do |format|
      if @project_umbrella.update(project_umbrella_params)
        format.html { redirect_to projects_url, notice: 'Project umbrella was successfully updated.' }
        format.json { render :show, status: :ok, location: @project_umbrella }
      else
        format.html { render :edit }
        format.json { render json: @project_umbrella.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /project_umbrellas/1
  # DELETE /project_umbrellas/1.json
  def destroy
    if @project_umbrella.children? #warn user about deleting project umbrella with associated projects
      project_umbrella_id = @project_umbrella.id.to_s
      assoc_proj_list = @project_umbrella.get_children_string #instance methods
      assoc_projects = @project_umbrella.get_children
      assoc_wgs_list = '' #initialize variable to avoid null error
      assoc_projects.each do |assoc_proj| #loop through all associated projects
        if assoc_proj.children? #if there are any associated weekly goals
          assoc_wgs = assoc_proj.get_children_string
          if assoc_wgs.nil? then assoc_wgs = '' end #null handling
          assoc_wgs_list = assoc_wgs_list + assoc_wgs #concatenate list of associated weekly goals
        end
      end
      respond_to do |format|
        format.html
        format.js { render :js => "delete_pu_children("+project_umbrella_id+","+assoc_proj_list+","+assoc_wgs_list+");" } #confirmation window about whether to delete all children
      end 
    else #if project umbrella has no children, just destroy umbrella and be done with it
      @project_umbrella.destroy

      respond_to do |format|
        format.html { redirect_to projects_url, notice: 'Project umbrella was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  end

  def delete_project_umbrella_and_projects #called from application.js function delete pu children
    project_umbrella = ProjectUmbrella.find(params[:project_umbrella_id]) #find project umbrella based on ajax call parameter
    assoc_projects = project_umbrella.get_children # get all associated projects

    assoc_projects.each do |assoc_proj| #loop through all associated projects
      project = Project.find(assoc_proj.id)
      assoc_wgs = project.get_children #get all associated weekly goals
      WeeklyGoal.destroy(assoc_wgs.map(&:id)) #destroy all associated weekly goals
    end

    Project.destroy(assoc_projects.map(&:id)) #destroy all associated projects

    project_umbrella.destroy #destroy project umbrella

    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Project Umbrella was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project_umbrella
      @project_umbrella = ProjectUmbrella.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_umbrella_params
      params.require(:project_umbrella).permit(:name, :projects)
    end
end
