class Vehicle < ActiveRecord::Base
  belongs_to :owner, class_name: User

  validates :year,  presence: true
  validates :make,  presence: true
  validates :model, presence: true
  validates :owner, presence: true

  def to_s
    "#{year} #{make} #{model}"
  end
end
