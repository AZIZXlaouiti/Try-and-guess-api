class ChatChannel < ApplicationCable::Channel
  def subscribed
    stream_from "chat_channel"
    ActionCable.server.broadcast "chat_channel" ,
    chat_msg: ActiveModel::Serializer::CollectionSerializer
    .new(ChatMessage.all, serializer: ChatMessageSerializer
    ).as_json
  
  end

  def unsubscribed
    puts "unsubscribing now!"
    @connected =  Room.first.users.where('online = ?',true)
    ActionCable.server.broadcast "room_channel" ,
    room: ActiveModel::Serializer::CollectionSerializer
    .new(@connected, serializer: UserSerializer
    ).as_json
  end
  def create(opts)
    @user = User.find_by(id: opts["user_id"])
    ChatMessage.create(
        user_id:opts["user_id"],
        room_id: 1,
        content: "#{opts['content']}"
      )
  end
  def disconnect(opts)
    @user = User.find_by(username: opts["user"])
    @user.disappear
  end  
end




