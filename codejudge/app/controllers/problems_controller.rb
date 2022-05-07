class ProblemsController < ApplicationController
  before_action :set_problem, only: %i[ show edit update destroy ]

  before_action :set_languages

  # GET /problems or /problems.json
  def index
    @problems = Problem.all
    render :index
  end

  # GET /problems/1 or /problems/1.json
  def show
    @languages_list = Language.pluck(:pretty_name)
    @attempt = Attempt.new
    @visible_test_cases = @problem.visible_test_cases @problem, current_user.role
    @no_test_cases_prompt = current_user.role?(:student) ? "No example Test Cases provided." : "No Test Cases were specified for that Problem."
  end

  # GET /problems/new
  def new
    @problem = Problem.new
    authorize @problem
    # @test_cases = @problem.test_cases
  end

  # GET /problems/1/edit
  def edit
    authorize :problem
  end

  # POST /problems or /problems.json
  def create
    @problem = Problem.new(problem_params)
    authorize @problem

    respond_to do |format|
      if @problem.save
        format.html { redirect_to problem_url(@problem), notice: "Problem was successfully created." }
        format.json { render :show, status: :created, location: @problem }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @problem.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /problems/1 or /problems/1.json
  def update
    authorize :problem
    respond_to do |format|
      if @problem.update(problem_params)
        format.html { redirect_to problem_url(@problem), notice: "Problem was successfully updated." }
        format.json { render :show, status: :ok, location: @problem }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @problem.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /problems/1 or /problems/1.json
  def destroy
    authorize @problem
    
    @problem.destroy

    respond_to do |format|
      format.html { redirect_to problems_url, notice: "Problem was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_problem
      @problem = Problem.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def problem_params
      params.require(:problem).permit(:title, :body, test_cases_attributes: [:id, :input, :output, :example, :_destroy])
    end

    def set_languages
      @languages = ['Bash', 'C++', 'Python']
    end
end
