#typed: true

class Api::V1::MercuryController < ApplicationController
  extend T::Sig

  def index
    render json: convo_params, status: :ok
  end

  def connect_users
    Conversation.create_conversation_for_users(convo_params)

    render json: {test: 'it did the thing'}, status: :ok
  end

  private

  def convo_params
    T.unsafe(params.require(:data)).permit(:driver_number, :owner_number, :booking_id)
  end
end
