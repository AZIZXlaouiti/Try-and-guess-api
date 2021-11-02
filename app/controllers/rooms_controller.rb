class RoomsController < ApplicationController
    skip_before_action :authorized
    def index 
        rooms = Room.all
        render json: rooms
    end
end
