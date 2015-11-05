require 'rails_helper'

RSpec.describe Vehicle, type: :model do
  # Validations
  it { should validate_presence_of(:year) }
  it { should validate_presence_of(:make) }
  it { should validate_presence_of(:model) }

  context '.create' do
    before do
      @vehicle = create :vehicle
    end

    it 'assumes this vehicle is currently_owned by default' do
      expect(@vehicle.currently_owned).to eq(true)
    end
  end
end
