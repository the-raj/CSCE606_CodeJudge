class GraderChannel < ApplicationCable::Channel
  def subscribed
    puts "USER SUBSCRIBED"
    stream_for "grader_channel"
  end
  
  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
