class ChatMessagesController < ApplicationController
  skip_before_action :authorized , only:[:index]  
  def index
        @chat_messages = ChatMessage.all
        render json: @chat_messages
      end
end
