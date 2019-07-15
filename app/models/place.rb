class Place < ApplicationRecord
  belongs_to :user
  validates :name, length: {minimum: 3, 
    too_short: "Name does not meet the minimum required characters (#{count})"}
  validates :name, :address, :description, presence: true
  paginates_per 5
end
