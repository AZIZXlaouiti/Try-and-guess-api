class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room_channel"
    @member = Room.first.users.find_by_username(params[:member][:username])
    if (!@member) 
      Room.first.members.create(user_id:params[:member][:id])
    end
    @connected =  Room.first.users.where('online = ?',true)
    ActionCable.server.broadcast "room_channel" ,
    room: ActiveModel::Serializer::CollectionSerializer
    .new(@connected, serializer: UserSerializer
    ).as_json
  end

  def unsubscribed
    @connected =  Room.first.users.where('online = ?',true)
    ActionCable.server.broadcast "room_channel" ,
    room: ActiveModel::Serializer::CollectionSerializer
    .new(@connected, serializer: UserSerializer
    ).as_json
    # Any cleanup needed when channel is unsubscribed
  end
end
