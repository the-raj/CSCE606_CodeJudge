## This is the class which handles grading the code
## It is an example of the facade pattern
## If glot.io needs to be replaced, only this file needs to be modified
## 
## Input:testcases, language, code
## Output: hash with "Pass" if passed, stdout if failed, and stderr if error
## Each item in the hash is a test case

class Grader

  require 'rest-client'

  @@glot_api_token = ENV["GLOT_KEY"]

  def initialize(testcases, language, code, current_user, current_attempt)
    @testcases = testcases
    @language = language
    @extension = Language.where(name: @language).pick(:extension)
    @code = code
    @current_user = current_user
    @current_attempt = current_attempt
  end

  def grade

    header_token = "Token " + @@glot_api_token

    @headers = {"Authorization" => header_token, "Content-type" => "application/json"}

    @url = "https://glot.io/api/run/#{@language}/latest"

    results = {}

    #Left as array for future batching support

    @testcases.each do |key,value|

      @array = Array.new

      payload = {}
      payload[:stdin] = key
      payload[:files] = @array << {:name => "main#{@extension}", :content => @code}
      payload = payload.to_json
      response = RestClient.post(@url, payload, headers=@headers)
      decoded_response = JSON.parse(response.body)

      @passed = decoded_response['stdout'].strip == value ? true : false
      @stdout = decoded_response['stdout']
      @stderr = decoded_response['stderr']

      @testcase = TestCase.where(input: key).first()

      @attempt = Attempt.find(@current_attempt)

      Score.create!(passed: @passed, stdout: @stdout, stderr: @stderr, attempt: @attempt, test_case: @testcase)

    
      return {passed: @passed, stdout: @stdout, stderr: @stderr}
    end
  end
end

