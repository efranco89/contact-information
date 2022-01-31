require 'rails_helper'

RSpec.describe FileLog, type: :model do
  describe 'relationships' do
    it { should belong_to(:user) }
    it { should have_many(:contact_log_failures) }
  end
end
