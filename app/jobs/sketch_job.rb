class SketchJob < ApplicationJob
  queue_as :default

  def perform(canvas)
    # Do something later
    ActionCable
      .server
      .broadcast('sketch_channel',
          canvas
        
      )
  end
end
