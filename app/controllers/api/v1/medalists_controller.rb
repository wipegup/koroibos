class Api::V1::MedalistsController < ApplicationController
  def index
    event = Event.find(params[:event_id])
    response = MedalistSerializer.new(event)

    render json: response.json, status:response.status
  end


end
