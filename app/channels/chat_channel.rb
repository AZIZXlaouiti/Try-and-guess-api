class ChatChannel < ApplicationCable::Channel
  
  def subscribed
    stream_from "chat_channel"
    # @user = User.find_by(username: params[:user])
    # @user.appear
    # @connected = User.all.select{|user| user.online}
    # @turn = @connected.first
    # ActionCable.server.broadcast "chat_channel", join: "#{params[:user]} joined ! ", connected:@connected , turn:@turn
    ActionCable.server.broadcast "chat_channel" ,
    chat_msg: ActiveModel::Serializer::CollectionSerializer
    .new(ChatMessage.all, serializer: ChatMessageSerializer
    ).as_json
  
  end

  def unsubscribed
    puts "unsubscribing now!"
    @user = User.find_by(username: params[:user])
    @user.disappear
    # @connected = User.all.select{|user| user.online}
    # @turn = @connected.first
    # ActionCable.server.broadcast "chat_channel"
  end
  # def start 
  #   @@word = Word.all.sample
  #   ActionCable.server.broadcast "chat_channel" ,word:@@word
  # end
  # def start_timer(opts)
  #   60.downto(0) do |count|
  #     ActionCable.server.broadcast "chat_channel", timer: count
  #     sleep 0.5
  # end

  #   ActionCable.server.broadcast "chat_channel", timer: "time is out !!" 
  #   sleep 2.5
  #   ActionCable.server.broadcast "chat_channel", timer: 60
    
  # end
  def create(opts)
    # byebug
    @user = User.find_by(id: opts["user_id"])
    ChatMessage.create(
        user_id:opts["user_id"],
        room_id: 1,
        content: "#{opts['content']}"
      )
  end

end



