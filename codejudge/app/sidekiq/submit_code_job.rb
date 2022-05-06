class SubmitCodeJob
  include Sidekiq::Job

  def perform(*args)
    input = args[0]
    output = args[1]

    @testcase = {}
    @testcase.store(input,output)

    language = args[2]
    code = args[3]
    test_case_number = args[4]

    grader = Grader.new(@testcase,language,code)

    results = grader.grade

    puts(results)

  end
end
