# typed: true

class Api::V1::MercuryController < ApplicationController
  extend T::Sig

  def index
    render json: convo_params, status: :ok
  end

  def connect_users
    
  end

  private

  sig {returns(T.untyped)}
  def convo_params
    params.require(:data).permit(:driver_number, :owner_number, :booking_id)
  end
end
