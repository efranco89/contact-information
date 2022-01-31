require 'rails_helper'

RSpec.describe Contact, type: :model do

  describe 'validates_not_repeated_contact_info' do

    context 'When there is not a contact with the email' do

      let!(:user) { create(:user) }
      let!(:contact_info) {
        create(:contact, :visa_good_number, user_id: user.id)
      }

      it "the contact is saved" do
        contact = Contact.new
        contact.name = "John Doe"
        contact.birthday = "2000/10/22"
        contact.phone = "(+57) 310 618 44 74"
        contact.address = "La calle primera"
        contact.credit_card = "4123456789123456"
        contact.email = "new_contact_email@example.com"
        contact.user_id = user.id
        contact.save
        expect(contact.persisted?).to be true
      end

    end

    context 'When there is a contac with that email but belongs to another user' do

      let!(:user) { create(:user) }
      let!(:user_2) { create(:user) }
      let!(:contact_info) {
        create(:contact, :visa_good_number, user_id: user.id)
      }

      it "the contact is saved" do
        contact = Contact.new
        contact.name = "John Doe"
        contact.birthday = "2000/10/22"
        contact.phone = "(+57) 310 618 44 74"
        contact.address = "La calle primera"
        contact.credit_card = "4123456789123456"
        contact.email = "new_contact_email@example.com"
        contact.user_id = user_2.id
        contact.save
        expect(contact.persisted?).to be true
      end

    end

    context 'When the user has a contact info with the same email' do

      let!(:user) { create(:user) }
      let!(:contact_info) {
        create(
          :contact,
          :visa_good_number,
          email: 'new_contact_email@example.com',
          user_id: user.id
        )
      }

      it "Adds error to the base" do
        contact = Contact.new
        contact.name = "John Doe"
        contact.birthday = "2000/10/22"
        contact.phone = "(+57) 310 618 44 74"
        contact.address = "La calle primera"
        contact.credit_card = "4123456789123456"
        contact.email = "new_contact_email@example.com"
        contact.user_id = user.id
        contact.save
        expect(contact.errors.details[:email][0][:error]). to eq(
          'The user already has a contact info with that email'
        )
      end

    end

  end
end
