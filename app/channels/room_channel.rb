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
  def start(opts) 
    Room.first.update(chosen_word: opts["word"] , game_started: true)
    ActionCable.server.broadcast "room_channel" ,word: Room.first
  end
  def end_timer()
    Room.first.update( game_started: false)
    ActionCable.server.broadcast "room_channel" ,word: Room.first
  end
  def timer(opts)
    Room.first.update(counter: opts['counter'])
    ActionCable.server.broadcast "room_channel" ,counter: Room.first
 
  end
end
