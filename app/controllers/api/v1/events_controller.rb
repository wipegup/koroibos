class Api::V1::EventsController < ApplicationController
  def index
    ser = EventSerializer.new.json
    # binding.pry
    render json: ser, status: 200
  end
end
