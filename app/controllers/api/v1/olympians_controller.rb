class Api::V1::OlympiansController < ApplicationController
  def index
    serialized = AthleteSerializer.new.json
    # binding.pry
    render json: serialized, status: 200
  end
end
