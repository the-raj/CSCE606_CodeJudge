class GraderChannel < ApplicationCable::Channel
  def subscribed
    stream_from current_user
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
