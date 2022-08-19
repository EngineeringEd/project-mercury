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

  def delete
    Conversation.create_client.conversations.v1.conversations('CH71b0c0ab005e41b49cce2487e5c61ec6').delete

    render json: {msg: "we did it"}, status: :ok
  end

  def get_all_and_delete
    convos = Conversation.create_client.conversations.v1.conversations.list(limit: 10)

    convos.each do |convo|
      Conversation.create_client.conversations
        .v1.conversations(convo.sid).delete
    end

    Conversation.delete_all

    render json: {msg: "deleted all the things from Twilio and db"}, status: :ok
  end
end
