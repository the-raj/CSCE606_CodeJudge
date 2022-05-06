class AttemptsController < ApplicationController

  require 'rest-client'
  require 'pygments'

  before_action :set_attempt, only: %i[ show edit update destroy ]

  # GET /attempts or /attempts.json
  def index
    unless current_user.role? :admin
      @attempts = current_user.attempts
    else
      @attempts = Attempt.all
    end
  end

  # GET /attempts/1 or /attempts/1.json
  def show
  end

  # GET /attempts/new
  def new
    @attempt = Attempt.new
  end

  # GET /attempts/1/edit
  def edit
  end

  # POST /attempts or /attempts.json
  def create
    @attempt = Attempt.new

    @attempt.language_id = Language.all.where(name: params[:attempt][:language]).pick(:id)
    @attempt.code = File.read(params[:attempt][:sourcecode])
    @attempt.user_id = session[:user_id]
    @attempt.problem_id = params[:problem_id]

    @problem = Problem.where(id: :problem_id)

    @testcases_array = @problem.joins(:test_cases)
    puts(@testcases_array)

    respond_to do |format|
      if @attempt.save
        format.html { redirect_to attempt_url(@attempt), notice: "Attempt was successfully created." }
        format.json { render :show, status: :created, location: @attempt }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @attempt.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /attempts/1 or /attempts/1.json
  def update
    respond_to do |format|
      if @attempt.update(attempt_params)
        format.html { redirect_to attempt_url(@attempt), notice: "Attempt was successfully updated." }
        format.json { render :show, status: :ok, location: @attempt }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @attempt.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /attempts/1 or /attempts/1.json
  def destroy
    @attempt.destroy

    respond_to do |format|
      format.html { redirect_to attempts_url, notice: "Attempt was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_attempt
      @attempt = Attempt.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def attempt_params
      params.require(:attempt).permit(:code)
    end
end
