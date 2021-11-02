class Room < ApplicationRecord
    has_many :chat_messages , dependent: :destroy
    has_many :users, through: :chat_messages
end
