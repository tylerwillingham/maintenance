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
  end

  it "should respond to .to_s" do
    expect(unpersisted_vehicle).to respond_to(:to_s)
  end
end
