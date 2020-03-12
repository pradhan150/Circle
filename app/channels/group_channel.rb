class GroupChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    group = Group.find params[:group]
    stream_for params[:channel]
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
