require 'rails_helper'

RSpec.describe ImportContactCvs, type: :lib do

  describe "starts_import" do
    context "file headers are valid and all records are valid" do
      let(:user) { create(:user) }
      let(:file_path) { "#{Rails.root}/spec/files/contacts_all_ok.csv" }
      let(:file_log) {
        create(:file_log, user_id: user.id, file_name: 'contacts_all_ok.csv')
      }

      let(:imported_contacts) {
        ImportContactCvs.starts_import(
          file_path: file_path,
          current_user: user,
          file_log: file_log
        )
      }

      it "Return ok message" do
        expect(imported_contacts[0]).to be true
        expect(imported_contacts[1]).to eq('All The contacts has been imported')
        expect(file_log.status).to eq('Finished')
        expect(file_log.message).to eq('All The contacts has been imported')
      end

    end
  end
end
