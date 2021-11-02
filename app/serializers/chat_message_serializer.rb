class ChatMessageSerializer  < ActiveModel::Serializer
 attributes :user_id, :room_id, :content
end
