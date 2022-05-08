module AttemptsHelper
  def attempt_status(attempt)
    Score.where(attempt_id: attempt.id).pluck(:passed).all?()
  end

  def attempt_status_string(attempt)
    scores = Score.where(attempt_id: attempt.id).pluck(:passed)
    if scores.length == 0
      "Running"
    elsif scores.all?()
      "Passed"
    else
      "Failed"
    end 
  end
end
