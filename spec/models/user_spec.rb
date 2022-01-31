require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:email) }
  end

  describe 'relationships' do
    it { should have_many(:contacts) }
    it { should have_many(:contact_log_failures) }
    it { should have_many(:file_logs) }
  end
end
