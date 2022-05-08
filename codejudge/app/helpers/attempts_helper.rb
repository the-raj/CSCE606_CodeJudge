module AttemptsHelper
  def attempt_status(attempt)
    Score.where(attempt_id: attempt.id).pluck(:passed).all?() ? "Passed" : "Failed"
  end
end
