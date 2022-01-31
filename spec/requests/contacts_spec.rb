require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/contacts", type: :request do

  describe "GET /index" do

    let!(:user) { create(:user) }
    let!(:contacts) {
      create_list(:contact, 3, :visa_good_number, user_id: user.id)
    }

    let!(:user_2) { create(:user) }
    let!(:user_2_contact) {
      create(
        :contact,
        :visa_good_number,
        user_id: user_2.id,
        name: "User One should not have this name"
      )
    }
    before :each do
      sign_in user
    end

    it "Renders only the contacts that belong to the sessions user" do
      get contacts_url
      expect(response).to be_successful
      expect(response.body).to include(contacts.first.name)
      expect(response.body).to_not include(user_2_contact.name)
    end
  end
end
