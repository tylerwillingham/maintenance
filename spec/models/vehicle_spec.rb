require 'rails_helper'

RSpec.describe Vehicle, type: :model do
  # Associations
  it { should belong_to(:owner) }

  # Validations
  it { should validate_presence_of(:year) }
  it { should validate_presence_of(:make) }
  it { should validate_presence_of(:model) }
  it { should validate_presence_of(:owner) }

  context '.create' do
    before do
      @vehicle = create :vehicle
    end

    it 'assumes this vehicle is currently_owned by default' do
      expect(@vehicle.currently_owned).to eq(true)
    end
  end
end
