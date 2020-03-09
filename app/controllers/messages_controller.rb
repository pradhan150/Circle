class MessagesController < ApplicationController
  def create
    @message = current_user.messages.create(message_params)
  #GroupChannel.broadcast_to(message.group, message)
   ActionCable.server.broadcast 'group_channel',message: @message
  end

  private

    def message_params
      params.require(:message).permit(:body, :group_id)
    end
end
