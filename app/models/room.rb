class Room < ApplicationRecord
    has_many :chat_messages , dependent: :destroy
    has_many :members
    has_many :users, through: :members
end
