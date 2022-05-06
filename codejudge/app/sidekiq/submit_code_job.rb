class SubmitCodeJob
  include Sidekiq::Job

  def perform(*args)
    puts("Performed job!")
    input = args[0]
    output = args[1]

    @testcase = {}
    @testcase.store(input,output)

    language = args[2]
    code = args[3]
    test_case_number = args[4]

    current_user = args[5]
    grader = Grader.new(@testcase,language,code,current_user)

    results = grader.grade

    puts(results)

  end
end
