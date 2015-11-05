require "rails_helper"

RSpec.describe ServiceRecord, type: :model do
  # Associations
  it { should belong_to(:vehicle).dependent(:destroy) }
 
  # Validations
  it { should validate_presence_of(:vehicle) }
  it { should validate_presence_of(:subject) }

  context ".to_s" do
    it "should return the subject" do
      service_record = build :service_record
      expect(service_record.to_s).to eq(service_record.subject)
    end
  end
end
