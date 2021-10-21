class ChatMessageJob < ApplicationJob
  queue_as :default

  def perform(chat_message)
    # Do something later
    # 2 second thing to fire after chat_channel#create
    ActionCable
      .server
      .broadcast('chat_channel',
          chat_message
          # width: 800
          # lines: [points:{x: 381.80220498191636, y: 198.85539839868198}],
          # height: 600,
      )
      # lines : [{points:[{x:,y:}] , brushColor: , brushRadius:}]
  end
end
