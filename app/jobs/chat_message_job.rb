class ChatMessageJob < ApplicationJob
  queue_as :default

  def perform(chat_message)
    # Do something later
    ActionCable
      .server
      .broadcast('chat_channel',
          chat_message
      )
  end
end
