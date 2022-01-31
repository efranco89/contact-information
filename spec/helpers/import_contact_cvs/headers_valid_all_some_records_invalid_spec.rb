require 'rails_helper'

RSpec.describe ImportContactCvs, type: :lib do

  describe "starts_import" do
    context "file headers are valid and some records are invalid" do
      let!(:user) { create(:user) }
      let!(:file_path) { "#{Rails.root}/spec/files/contacts.csv" }
      let!(:file_log) {
        create(:file_log, user_id: user.id, file_name: 'contacts.csv')
      }

      let!(:imported_contacts) {
        ImportContactCvs.starts_import(
          file_path: file_path,
          current_user: user,
          file_log: file_log
        )
      }

      it "Return ok and message warning of errors" do
        expect(imported_contacts[0]).to be true
        expect(imported_contacts[1]).to eq('File processed with error please check log')
        expect(file_log.status).to eq('Finished')
        expect(file_log.message).to eq('File processed with error please check log')
      end

      it "Creates a contact log failure" do
        contact_log_failure = ContactLogFailure.last
        expect(contact_log_failure).to_not be_nil
        expect(contact_log_failure.data).to_not be_empty
        expect(contact_log_failure.file_log_id).to eq(file_log.id)
        expect(contact_log_failure.error).to eq(
          "card: The credit card number is incorrect, please verify, franchise: can't be blank"
        )
      end

    end
  end
end
