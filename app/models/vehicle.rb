class Vehicle < ActiveRecord::Base
  belongs_to :owner, class_name: User

  validates :year,  presence: true
  validates :make,  presence: true
  validates :model, presence: true
  validates :owner, presence: true
  validate :sale_date_later_than_purchase_date,
           if: -> { purchase_date && sale_date }

  def to_s
    "#{year} #{make} #{model}"
  end

  private

  def sale_date_later_than_purchase_date
    return unless sale_date < purchase_date
    errors.add(:sale_date, ::I18n.t("vehicles.must_be_after_purchase_date"))
  end
end
