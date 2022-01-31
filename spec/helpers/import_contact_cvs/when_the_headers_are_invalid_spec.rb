require 'rails_helper'

RSpec.describe ImportContactCvs, type: :lib do

  describe "starts_import" do
    context "file headers are invalid" do
      let(:user) { create(:user) }
      let(:file_path) { "#{Rails.root}/spec/files/contacts_bad_headers.csv" }
      let(:file_log) {
        create(:file_log, user_id: user.id, file_name: 'contacts_bad_headers.csv')
      }

      let(:imported_contacts) {
        ImportContactCvs.starts_import(
          file_path: file_path,
          current_user: user,
          file_log: file_log
        )
      }


      it "Return error and updates file log" do
        expect(imported_contacts[0]).to be false
        expect(imported_contacts[1]).to eq('The file headers are invalid The following columns are required: name, birthday, phone')
        expect(file_log.status).to eq('Failed')
        expect(file_log.message).to eq('The file headers are invalid The following columns are required: name, birthday, phone')
      end

    end
  end
end
