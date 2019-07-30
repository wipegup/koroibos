class EventParticipation < ApplicationRecord
  belongs_to :athlete
  belongs_to :game
  belongs_to :event

  enum medal: ['NA', 'Gold', 'Silver', 'Bronze']
end
