class Vehicle < ActiveRecord::Base
  validates :year,  presence: true
  validates :make,  presence: true
  validates :model, presence: true
end
