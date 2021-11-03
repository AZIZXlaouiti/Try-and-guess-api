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
    @@word = Word.all.sample
    ActionCable.server.broadcast "chat_channel" ,word:@@word
  end
  def start_timer 
    60.downto(0) do |count|
      ActionCable.server.broadcast "chat_channel", timer: count
      sleep 1
    end
  end
  def create(opts)
    @user = User.find_by(id: opts["user_id"])
    ChatMessage.create(
        user_id:opts["user_id"],
        room_id: 1,
        content: "#{@user.username}: #{opts["content"]}"
      )
  end
  def guess(opts)
    @user = User.find_by(id: opts["user_id"])
    @user.gain
    ActionCable.server.broadcast "chat_channel", user: @user
    ChatMessage.create(
          content:"#{@user.username} guessed the word!",
          user_id:opts["user_id"],
          room_id: 1
        )
  end
end



