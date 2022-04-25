class SubmissionsController < ApplicationController

  #Idea: for current problem, query test cases and send one
  #by one to API, return results, save to database as attempt

  before_action :set_problem, only: %i[ show edit update destroy ]

  require 'rest-client'

  @@url_base = 'https://glot.io/api/run'

  #response = RestClient.post(

  #@problem = 

  @headers = {"Authorization": "Token 7dc296c5-b178-40d8-a0b2-00f06afd05a6",
              "Content-type": "application/json"}

  @payloads = ['{"files": [{"name": "test1.py", "content": "print(42)"}]}','{"files": [{"name": "test1.py", "content": "print(69)"}]}']

  #GET /submissions
  def index
    @submissions = Submission.all
  end

  #GET /submissions/1
  def show
  end

  #GET /submissions/new
  def new
    @submission = Submission.new
  end

  #GET /submissions/1/edit
  def edit
  end

  #POST /submissions
  def create
    @submission = Submission.new(submission_params)
  end

  def grade
    
    testcases = Problems.where("id = ?", params[:id]).joins(:test_cases)

  end

end
