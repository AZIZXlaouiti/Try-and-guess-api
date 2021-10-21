class PathsController < ApplicationController
    def index 
        render json: Path.all
    end
end
