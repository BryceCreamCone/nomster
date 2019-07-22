class Place < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :photos

  geocoded_by :address 
  after_validation :geocode

  validates :name, length: {minimum: 3, 
    too_short: "Name does not meet the minimum required characters (%{count})"}, presence: true 
  validates :address, :description, presence: true
  
  paginates_per 5
end