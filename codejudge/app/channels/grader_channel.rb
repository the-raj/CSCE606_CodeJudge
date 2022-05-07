class GraderChannel < ApplicationCable::Channel
  def subscribed
    puts "USER SUBSCRIBED"
    stream_from "grader_channel_#{current_user.id}"
  end
  
  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
