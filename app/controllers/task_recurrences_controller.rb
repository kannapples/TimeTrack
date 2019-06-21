class TaskRecurrencesController < ApplicationController
  before_action :set_task_recurrence, only: [:show, :edit, :update, :destroy]

  # GET /task_recurrences
  # GET /task_recurrences.json
  def index
    @task_recurrences = TaskRecurrence.all
  end

  # GET /task_recurrences/1
  # GET /task_recurrences/1.json
  def show
  end

  # GET /task_recurrences/new
  def new
    @task_recurrence = TaskRecurrence.new
  end

  # GET /task_recurrences/1/edit
  def edit
  end

  # POST /task_recurrences
  # POST /task_recurrences.json
  def create
    @task_recurrence = TaskRecurrence.new(task_recurrence_params)

    respond_to do |format|
      if @task_recurrence.save
        format.html { redirect_to @task_recurrence, notice: 'Task recurrence was successfully created.' }
        format.json { render :show, status: :created, location: @task_recurrence }
      else
        format.html { render :new }
        format.json { render json: @task_recurrence.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /task_recurrences/1
  # PATCH/PUT /task_recurrences/1.json
  def update
    respond_to do |format|
      if @task_recurrence.update(task_recurrence_params)
        format.html { redirect_to @task_recurrence, notice: 'Task recurrence was successfully updated.' }
        format.json { render :show, status: :ok, location: @task_recurrence }
      else
        format.html { render :edit }
        format.json { render json: @task_recurrence.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /task_recurrences/1
  # DELETE /task_recurrences/1.json
  def destroy
    @task_recurrence.destroy
    respond_to do |format|
      format.html { redirect_to task_recurrences_url, notice: 'Task recurrence was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task_recurrence
      @task_recurrence = TaskRecurrence.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_recurrence_params
      params.require(:task_recurrence).permit(:name)
    end
end
