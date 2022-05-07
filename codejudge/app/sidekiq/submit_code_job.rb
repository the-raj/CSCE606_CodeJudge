class SubmitCodeJob
  include Sidekiq::Job
  sidekiq_options retry: 0

  def perform(*args)
    puts("Performed job!")
    puts "TEST"
    input = args[0]
    output = args[1]
    @testcase = {}
    @testcase.store(input,output)

    language = args[2]
    code = args[3]
    test_case_number = args[4]

    current_user = args[5]
    grader = Grader.new(@testcase,language,code,current_user)

    sleep(5)
    puts current_user
    GraderChannel.broadcast_to(
      "grader_channel",
      { test: "This is a test!" }
    )

    # results = grader.grade

    # puts(results)

  end
end
