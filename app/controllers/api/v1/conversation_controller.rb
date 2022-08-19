# typed: true

class Api::V1::ConversationController < ApplicationController
  def get
    @convo = Conversation.create_client.conversations.v1.conversations(params.fetch('sid')).fetch

    render json: {
      sid: @convo.sid,
      chat_sid: @convo.chat_service_sid,
      messaging_sid: @convo.messaging_service_sid
    }, status: :ok
  end
end
