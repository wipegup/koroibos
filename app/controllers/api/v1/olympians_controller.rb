class Api::V1::OlympiansController < ApplicationController
  def index
    response = AthleteSerializer.new(filters)
    
    render json: response.json, status: response.status
  end

  private
  def filters
    params.permit(:age)
  end
end
