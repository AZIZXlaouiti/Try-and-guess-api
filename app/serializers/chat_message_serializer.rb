class ChatMessageSerializer  < ActiveModel::Serializer
 attributes :content
 belongs_to :user
end
