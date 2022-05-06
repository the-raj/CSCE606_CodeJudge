class AttemptsController < ApplicationController

  require 'rest-client'
  require 'pygments'

  before_action :set_attempt, only: %i[ show edit update destroy ]

  # GET /attempts or /attempts.json
  def index
    @attempts = Attempt.all
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

    puts(params[:attempt][:pretty_name])

    @attempt.language_id = Language.all.where(:pretty_name: params[:attempt][:pretty_name]).pick(:id)

    puts(@attempt.language_id, "LANGUAGEID")

    @attempt.code = File.read(params[:attempt][:sourcecode])
    @attempt.user_id = session[:user_id]
    @attempt.problem_id = params[:problem_id]

    @testcases_query = TestCase.left_outer_joins(:problem).where(problem_id: @attempt.problem_id).map{ |r| [r.input, r.output]}

    @testcases = {}

    puts(@testcases_query)

    @testcases_query.each do |item|
      @testcases.store(item[0], item[1])
      SubmitCodeJob.perform_async(item[0], item[1], params[:attempt][:language], @attempt.code, @testcases_query.index(item))
    end

    #grader = Grader.new(@testcases,params[:attempt][:language],@attempt.code)

    #results = grader.grade

    #puts(results)

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
