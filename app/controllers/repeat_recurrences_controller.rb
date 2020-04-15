class RepeatRecurrencesController < ApplicationController
  before_action :set_repeat_recurrence, only: [:show, :edit, :update, :destroy]

  # GET /repeat_recurrences
  # GET /repeat_recurrences.json
  def index
    @repeat_recurrences = RepeatRecurrence.all
  end

  # GET /repeat_recurrences/1
  # GET /repeat_recurrences/1.json
  def show
  end

  # GET /repeat_recurrences/new
  def new
    @repeat_recurrence = RepeatRecurrence.new
  end

  # GET /repeat_recurrences/1/edit
  def edit
  end

  # POST /repeat_recurrences
  # POST /repeat_recurrences.json
  def create
    @repeat_recurrence = RepeatRecurrence.new(repeat_recurrence_params)

    respond_to do |format|
      if @repeat_recurrence.save
        format.html { redirect_to @repeat_recurrence, notice: 'repeat recurrence was successfully created.' }
        format.json { render :show, status: :created, location: @repeat_recurrence }
      else
        format.html { render :new }
        format.json { render json: @repeat_recurrence.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /repeat_recurrences/1
  # PATCH/PUT /repeat_recurrences/1.json
  def update
    respond_to do |format|
      if @repeat_recurrence.update(repeat_recurrence_params)
        format.html { redirect_to @repeat_recurrence, notice: 'repeat recurrence was successfully updated.' }
        format.json { render :show, status: :ok, location: @repeat_recurrence }
      else
        format.html { render :edit }
        format.json { render json: @repeat_recurrence.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /repeat_recurrences/1
  # DELETE /repeat_recurrences/1.json
  def destroy
    @repeat_recurrence.destroy
    respond_to do |format|
      format.html { redirect_to repeat_recurrences_url, notice: 'Repeat recurrence was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_repeat_recurrence
      @repeat_recurrence = RepeatRecurrence.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def repeat_recurrence_params
      params.require(:repeat_recurrence).permit(:name)
    end
end
