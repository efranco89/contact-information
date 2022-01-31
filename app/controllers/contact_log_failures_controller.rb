class ContactLogFailuresController < ApplicationController
  before_action :set_contact_log_failure, only: %i[ show edit update destroy ]

  # GET /contact_log_failures or /contact_log_failures.json
  def index
    @contact_log_failures = ContactLogFailure.where(user_id: current_user.id).paginate(page: params[:page], per_page: 5)
  end

  private

end
