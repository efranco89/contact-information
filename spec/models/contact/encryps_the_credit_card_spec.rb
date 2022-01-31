require 'rails_helper'

RSpec.describe Contact, type: :model do

  describe 'encryps_the_credit_card' do

    context 'When credit card number is valid' do

      it "encrypts the credit card number" do
        contact = Contact.new
        contact.name = "John Doe"
        contact.birthday = "2000/10/22"
        contact.phone = "(+57) 310 618 44 74"
        contact.address = "La calle primera"
        contact.credit_card = "4123456789123456"
        contact.email = "luisfrancoz1@gmail.com"
        contact.user_id = 1
        contact.save
        expect(contact.credit_card_ciphertext).to_not eq(contact.credit_card)
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

    context 'When credit card number is nil' do

      it "Adds error to the base" do
        contact = Contact.new
        contact.name = "John Doe"
        contact.birthday = "2000/10/22"
        contact.phone = "(+57) 310 618 44 74"
        contact.address = "La calle primera"
        contact.credit_card = nil
        contact.email = "luisfrancoz1@gmail.com"
        contact.user_id = 1
        contact.save
        expect(contact.errors.details[:credit_card][0][:error]). to eq(
          'The credit card number is either nil or empty'
        )
      end

      it "Adds error to the base" do
        contact = Contact.new
        contact.name = "John Doe"
        contact.birthday = "2000/10/22"
        contact.phone = "(+57) 310 618 44 74"
        contact.address = "La calle primera"
        contact.credit_card = ""
        contact.email = "luisfrancoz1@gmail.com"
        contact.user_id = 1
        contact.save
        expect(contact.errors.details[:credit_card][0][:error]). to eq(
          'The credit card number is either nil or empty'
        )
      end

    end

  end
end
