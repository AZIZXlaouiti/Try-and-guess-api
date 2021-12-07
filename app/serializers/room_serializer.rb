class RoomSerializer < ActiveModel::Serializer
  attributes :name
  has_many :users
  has_many :chat_messages
end
