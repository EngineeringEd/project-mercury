#typed: true

class Conversation < ApplicationRecord
  attr_accessor :client

  class << self
    def create_conversation_for_users(convo_params)
      conversation = create_client.conversations.v1.conversations
        .create(friendly_name: "Conversation for booking #{convo_params.booking_id}")

      add_user_to_conversation_as_sms(conversation.sid, convo_params.fetch('driver_number'))
      add_user_to_conversation_as_chat(conversation.sid)

      self.create(
        sid: conversation.sid,
        chat_sid: conversation.chat_service_sid,
        messaging_sid: conversation.messaging_service_sid,
        driver_number: convo_params.driver_number,
        owner_number: convo_params.owner_number,
        friendly_name: "Conversation for booking #{convo_params.booking_id}",
        booking_id: convo_params.booking_id
      )
    end

    def create_client
      Twilio::REST::Client.new(ENV.fetch('TWILIO_SID'), ENV.fetch('TWILIO_AUTH_TOKEN'))
    end

    private

    def add_user_to_conversation_as_sms(convo_sid, user_phone_number)
      Conversation.create_client
      .conversations
      .v1
      .conversations(convo_sid)
      .participants
      .create(
        messaging_binding_address: user_phone_number,
        messaging_binding_proxy_address: ENV.fetch('TWILIO_PROXY_NUMBER')
      )
    end

    def add_user_to_conversation_as_chat(convo_sid)
      # hard coded for now. Probs will change

      Conversation.create_client
      .conversations
      .v1
      .conversations(convo_sid)
      .participants
      .create(
        identity: 'testEdwardoSO'
      )
    end
  end
end
