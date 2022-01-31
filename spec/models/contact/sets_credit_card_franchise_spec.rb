require 'rails_helper'

RSpec.describe Contact, type: :model do

  describe 'sets_credit_card_franchise' do

    context 'When credit card number is valid' do

      it "verifies the franchise is set" do
        contact = Contact.new
        contact.name = "John Doe"
        contact.birthday = "2000/10/22"
        contact.phone = "(+57) 310 618 44 74"
        contact.address = "La calle primera"
        contact.credit_card = "4123456789123456"
        contact.email = "luisfrancoz1@gmail.com"
        contact.user_id = 1
        contact.save
        expect(contact.franchise).to_not be_empty

      end

    end

    context 'When credit card number is not valid' do

      it "Adds error to the base" do
        contact = Contact.new
        contact.name = "John Doe"
        contact.birthday = "2000/10/22"
        contact.phone = "(+57) 310 618 44 74"
        contact.address = "La calle primera"
        contact.credit_card = "0123456789123456"
        contact.email = "luisfrancoz1@gmail.com"
        contact.user_id = 1
        contact.save
        expect(contact.errors.details[:credit_card][0][:error]). to eq(
          'The credit card number is incorrect, please verify'
        )
      end

    end

  end
end
