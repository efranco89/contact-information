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

RSpec.describe "/file_logs", type: :request do
  #
  # # FileLog. As you add validations to FileLog, be sure to
  # # adjust the attributes here as well.
  # let(:valid_attributes) {
  #   skip("Add a hash of attributes valid for your model")
  # }
  #
  # let(:invalid_attributes) {
  #   skip("Add a hash of attributes invalid for your model")
  # }
  #
  # describe "GET /index" do
  #   it "renders a successful response" do
  #     FileLog.create! valid_attributes
  #     get file_logs_url
  #     expect(response).to be_successful
  #   end
  # end
  #
  # describe "GET /show" do
  #   it "renders a successful response" do
  #     file_log = FileLog.create! valid_attributes
  #     get file_log_url(file_log)
  #     expect(response).to be_successful
  #   end
  # end
  #
  # describe "GET /new" do
  #   it "renders a successful response" do
  #     get new_file_log_url
  #     expect(response).to be_successful
  #   end
  # end
  #
  # describe "GET /edit" do
  #   it "render a successful response" do
  #     file_log = FileLog.create! valid_attributes
  #     get edit_file_log_url(file_log)
  #     expect(response).to be_successful
  #   end
  # end
  #
  # describe "POST /create" do
  #   context "with valid parameters" do
  #     it "creates a new FileLog" do
  #       expect {
  #         post file_logs_url, params: { file_log: valid_attributes }
  #       }.to change(FileLog, :count).by(1)
  #     end
  #
  #     it "redirects to the created file_log" do
  #       post file_logs_url, params: { file_log: valid_attributes }
  #       expect(response).to redirect_to(file_log_url(FileLog.last))
  #     end
  #   end
  #
  #   context "with invalid parameters" do
  #     it "does not create a new FileLog" do
  #       expect {
  #         post file_logs_url, params: { file_log: invalid_attributes }
  #       }.to change(FileLog, :count).by(0)
  #     end
  #
  #     it "renders a successful response (i.e. to display the 'new' template)" do
  #       post file_logs_url, params: { file_log: invalid_attributes }
  #       expect(response).to be_successful
  #     end
  #   end
  # end
  #
  # describe "PATCH /update" do
  #   context "with valid parameters" do
  #     let(:new_attributes) {
  #       skip("Add a hash of attributes valid for your model")
  #     }
  #
  #     it "updates the requested file_log" do
  #       file_log = FileLog.create! valid_attributes
  #       patch file_log_url(file_log), params: { file_log: new_attributes }
  #       file_log.reload
  #       skip("Add assertions for updated state")
  #     end
  #
  #     it "redirects to the file_log" do
  #       file_log = FileLog.create! valid_attributes
  #       patch file_log_url(file_log), params: { file_log: new_attributes }
  #       file_log.reload
  #       expect(response).to redirect_to(file_log_url(file_log))
  #     end
  #   end
  #
  #   context "with invalid parameters" do
  #     it "renders a successful response (i.e. to display the 'edit' template)" do
  #       file_log = FileLog.create! valid_attributes
  #       patch file_log_url(file_log), params: { file_log: invalid_attributes }
  #       expect(response).to be_successful
  #     end
  #   end
  # end
  #
  # describe "DELETE /destroy" do
  #   it "destroys the requested file_log" do
  #     file_log = FileLog.create! valid_attributes
  #     expect {
  #       delete file_log_url(file_log)
  #     }.to change(FileLog, :count).by(-1)
  #   end
  #
  #   it "redirects to the file_logs list" do
  #     file_log = FileLog.create! valid_attributes
  #     delete file_log_url(file_log)
  #     expect(response).to redirect_to(file_logs_url)
  #   end
  # end
end
