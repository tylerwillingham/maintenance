require 'rails_helper'

RSpec.describe Vehicle, type: :model do
  # Associations
  it { should belong_to(:owner) }

  # Validations
  it { should validate_presence_of(:year) }
  it { should validate_presence_of(:make) }
  it { should validate_presence_of(:model) }
  it { should validate_presence_of(:owner) }

  let(:persisted_vehicle) { create :vehicle }
  let(:unpersisted_vehicle) { build :vehicle }

  context ".create" do
    it 'assumes this vehicle is currently_owned by default' do
      expect(persisted_vehicle.currently_owned).to eq(true)
    end

    it "does not allow a sale_date earlier than the purchase_date" do
      sold_vehicle = build :sold_vehicle, purchase_date: 1.day.ago,
                                          sale_date: 1.week.ago

      expect(sold_vehicle.valid?).to eq(false)
      expect(sold_vehicle.errors.key?(:sale_date)).to eq(true)

      sold_vehicle.sale_date = sold_vehicle.purchase_date + 1.month
      expect(sold_vehicle.valid?).to eq(true)
    end
  end

  it "should respond to .to_s" do
    expect(unpersisted_vehicle).to respond_to(:to_s)
  end
end
