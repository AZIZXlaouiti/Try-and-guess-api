class ChatChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    stream_from 'chat_channel'
  end

  def unsubscribed
    puts "unsubscribing now!"
    # Any cleanup needed when channel is unsubscribed
  end
  def create(opts)
    #this will get called first when sending data back to channel 
    #opts = {"content"=>"up", "action"=>"create"}
    #params = {"channel"=>"ChatChannel"}
    ChatMessage.create(
      content: opts.fetch('content')
    )
    
  end
end
=begin

points 
comment line 2
=end