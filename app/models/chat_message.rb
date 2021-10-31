class ChatMessage < ApplicationRecord
  belongs_to :user
  belongs_to :room
    after_create_commit do 
      ChatMessageJob.perform_later({chat_messages: self}.to_json(except:[:created_at, :updated_at]))
  end
end
