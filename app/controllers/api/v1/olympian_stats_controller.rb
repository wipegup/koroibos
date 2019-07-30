class Api::V1::OlympianStatsController < ApplicationController
  def index
    render json: StatsSerializer.new.json, status: 200
  end
end
