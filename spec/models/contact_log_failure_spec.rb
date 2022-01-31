require 'rails_helper'

RSpec.describe ContactLogFailure, type: :model do
  describe 'relationships' do
    it { should belong_to(:user) }
    it { should belong_to(:file_log) }
  end
end
