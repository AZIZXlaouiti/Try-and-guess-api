class ChatMessageJob < ApplicationJob
  queue_as :default

  def perform(chat_message)
    # Do something later
    # 2 second thing to fire after chat_channel#create
    ActionCable
      .server
      .broadcast('chat_channel',
          chat_message
        
      )
     
  end
end
