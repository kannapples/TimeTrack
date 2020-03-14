class ProjectModulesController < ApplicationController
  before_action :set_project_module, only: [:show, :edit, :update, :destroy]

  # GET /project_modules
  # GET /project_modules.json
  def index
    @project_modules = ProjectModule.all
  end

  # GET /project_modules/1
  # GET /project_modules/1.json
  def show
  end

  # GET /project_modules/new
  def new
    @project_module = ProjectModule.new
    @projects = Project.all
  end

  # GET /project_modules/1/edit
  def edit
    @projects = Project.all
  end

  # POST /project_modules
  # POST /project_modules.json
  def create
    @project_module = ProjectModule.new(project_module_params)

    respond_to do |format|
      if @project_module.save
        format.html { redirect_to @project_module, notice: 'Project module was successfully created.' }
        format.json { render :show, status: :created, location: @project_module }
      else
        format.html { render :new }
        format.json { render json: @project_module.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /project_modules/1
  # PATCH/PUT /project_modules/1.json
  def update
    respond_to do |format|
      if @project_module.update(project_module_params)
        format.html { redirect_to @project_module, notice: 'Project module was successfully updated.' }
        format.json { render :show, status: :ok, location: @project_module }
      else
        format.html { render :edit }
        format.json { render json: @project_module.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /project_modules/1
  # DELETE /project_modules/1.json
  def destroy
    @project_module.destroy
    respond_to do |format|
      format.html { redirect_to project_modules_url, notice: 'Project module was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project_module
      @project_module = ProjectModule.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_module_params
      params.require(:project_module).permit(:name, :start_date, :completion_goal_date, :project_id)
    end
end
