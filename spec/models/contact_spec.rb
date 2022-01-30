require 'rails_helper'

RSpec.describe Contact, type: :model do

  describe 'validations' do
    it { should validate_presence_of(:address) }
    it { should validate_presence_of(:birthday) }
    it { should validate_presence_of(:credit_card) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:franchise) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:phone) }
  end

  describe 'relationships' do
    it { should belong_to(:user) }
  end
end
