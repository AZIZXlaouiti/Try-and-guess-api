class ChatChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    stream_from "chat_channel"
    @user = User.find_by(username: params[:user])
    @user.appear
    @room = Room.first.users.select{|e| e.online}.uniq
    ActionCable.server.broadcast "chat_channel", join: "#{params[:user]} has joined !", room: @room
  end

  def unsubscribed
    puts "unsubscribing now!"
    @user = User.find_by(username: params[:user])
    @user.disappear
    @room = Room.first.users.select{|e| e.online}.uniq
    ActionCable.server.broadcast "chat_channel", leave: "#{params[:user]} has left !" , room: @room
    # ChatMessage.create(
    #   user_id:@user.id,
    #   room_id: 1,
    #   content: "#{params[:user]} has left !",
    # )
    # Any cleanup needed when channel is unsubscribed
  end

  def create(opts)
    #this will get called first when sending data back to channel
    #opts = {"content"=>"up", "action"=>"create"}
    #params = {"channel"=>"ChatChannel"}
    ChatMessage.create(
      user_id:opts["user_id"],
      room_id: 1,
      content: opts.fetch("content"),
    )
  end
end

