class Api::V1::OlympiansController < ApplicationController
  def index
    serialized = AthleteSerializer.new(filters).json
    render json: serialized, status: 200
  end

  private
  def filters
    params.permit(:age)
  end
end
