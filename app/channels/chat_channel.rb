class ChatChannel < ApplicationCable::Channel
  def subscribed
    stream_from "chat_channel"
    @user = User.find_by(username: params[:user])
    @user.appear
    @connected = User.all.select{|user| user.online}
    @turn = @connected.first
    ActionCable.server.broadcast "chat_channel", join: "#{params[:user]} joined ! ", connected:@connected , turn:@turn
  end

  def unsubscribed
    puts "unsubscribing now!"
    @user = User.find_by(username: params[:user])
    @user.disappear
    @connected = User.all.select{|user| user.online}
    @turn = @connected.first
    ActionCable.server.broadcast "chat_channel", leave: "#{params[:user]} left !", connected:@connected, turn:@turn
  end
  def start 
    @word = Word.all.sample
    ActionCable.server.broadcast "chat_channel" ,word:@word , timer:start_timer
  end
  def start_timer 
    60.downto(0) do |i|
      "#{'%02d' % i}"
    sleep 1
  end
  end
  def create(opts)

    ChatMessage.create(
      user_id:opts["user_id"],
      room_id: 1,
      content: opts.fetch("content"),
    )
  end
end

