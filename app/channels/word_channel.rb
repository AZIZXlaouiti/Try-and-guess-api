class WordChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    # @user = User.find_by(username: params[:user])

    # Word.all.sample
    # stream_from "word_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
