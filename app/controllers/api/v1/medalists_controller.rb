class Api::V1::MedalistsController < ApplicationController
  def index
    response = MedalistSerializer.new(params[:event_id])

    render json: response.json, status:response.status
  end
end
