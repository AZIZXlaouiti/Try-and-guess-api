class SketchChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    stream_from "sketch_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
  def create(opts)
    #  byebug
    ActionCable.server.broadcast("sketch_channel",opts["canvas"])
  end
end
