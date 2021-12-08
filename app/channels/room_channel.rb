class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room_channel"
    @member = Room.first.users.find_by_username(params[:member][:username])
    if (!@member) 
      Room.first.members.create(user_id:params[:member][:id])
    end
    @connected =  Room.first.users.where('online = ?',true)
    ActionCable.server.broadcast "room_channel" ,room: Room.first,
    members: ActiveModel::Serializer::CollectionSerializer
    .new(@connected, serializer: UserSerializer
    ).as_json 
    
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
  def startGame(opts) 
    # if (opts['start']== true) 
    #   gameStarted
    # end
    # ActionCable.server.broadcast "room_channel" , start: opts["start"].as_json
  end
end
