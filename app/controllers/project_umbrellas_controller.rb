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
        format.html { redirect_to "/projects/new", notice: 'Project umbrella was successfully created.' }
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
        format.html { redirect_to @project_umbrella, notice: 'Project umbrella was successfully updated.' }
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
    @project_umbrella.destroy
    respond_to do |format|
      format.html { redirect_to project_umbrellas_url, notice: 'Project umbrella was successfully destroyed.' }
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
