class SketchesController < ApplicationController
    def index 
        render json: Sketch.all.to_json(except:[:id, :created_at, :updated_at],include:[paths: {only:[:x,:y]}])  
    end
end
