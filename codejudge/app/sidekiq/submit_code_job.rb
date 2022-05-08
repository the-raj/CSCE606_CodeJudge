class SubmitCodeJob
  include Sidekiq::Job
  sidekiq_options retry: 0

  def perform(*args)
    input = args[0]
    output = args[1]
    @testcase = {}
    @testcase.store(input,output)

    language = args[2]
    code = args[3]
    test_case_number = args[4]

    current_user = args[5]
    current_attempt = args[6]
    grader = Grader.new(@testcase,language,code,current_user, current_attempt)

    results = grader.grade
    ActionCable.server.broadcast(
      "grader_channel_#{current_user}",
      {
        id: test_case_number,
        passed: results[:passed],
        stdout: results[:stdout],
        stderr: results[:stderr],
        finished_at: Time.current.strftime("%m/%d/%Y %r")
      }
    )

  end
end
