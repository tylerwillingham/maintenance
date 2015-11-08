require 'rails_helper'

RSpec.describe User, type: :model do
  # Associations
  it { should have_many(:vehicles) }
end
