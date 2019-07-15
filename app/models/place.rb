class Place < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  paginates_per 5
end
