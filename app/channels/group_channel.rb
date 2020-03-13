class GroupChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    group = Group.find_by(id: params[:group])
    stream_for group

  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
