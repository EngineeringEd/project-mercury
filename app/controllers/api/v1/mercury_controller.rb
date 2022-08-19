# typed: true

class Api::V1::MercuryController < ApplicationController

  def index
    render json: {foo: "barr"}, status: :ok
  end
end
