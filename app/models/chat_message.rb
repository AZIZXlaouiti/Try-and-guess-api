class ChatMessage < ApplicationRecord
    after_create_commit do 
        ChatMessageJob.perform_later({chat_messages: ChatMessage.all}.to_json(except:[:created_at, :updated_at]))
    end
end
