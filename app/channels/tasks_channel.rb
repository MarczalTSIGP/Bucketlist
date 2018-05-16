class TasksChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    puts "subscribed"
    stream_from "list:#{params['list_id']}:tasks"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed 
    puts "unsubscribed"
  end

end
