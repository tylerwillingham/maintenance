class ServiceRecord < ActiveRecord::Base
  belongs_to :vehicle, dependent: :destroy

  validates :vehicle, presence: true
  validates :subject, presence: true
  validates :performed_on, presence: true

  alias_attribute :to_s, :subject
end
