class RoomSerializer < ActiveModel::Serializer
  attributes :name , :round
  has_many :users
  has_many :chat_messages
end
