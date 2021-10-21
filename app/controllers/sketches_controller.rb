class SketchesController < ApplicationController
    def index 
        render json: Sketch.all , include:[:paths]
    end
end
