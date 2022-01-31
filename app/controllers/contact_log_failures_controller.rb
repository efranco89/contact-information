class ContactLogFailuresController < ApplicationController
  before_action :set_contact_log_failure, only: %i[ show edit update destroy ]

  # GET /contact_log_failures or /contact_log_failures.json
  def index
    @contact_log_failures = ContactLogFailure.all
  end

  # GET /contact_log_failures/1 or /contact_log_failures/1.json
  def show
  end

  # GET /contact_log_failures/new
  def new
    @contact_log_failure = ContactLogFailure.new
  end

  # GET /contact_log_failures/1/edit
  def edit
  end

  # POST /contact_log_failures or /contact_log_failures.json
  def create
    @contact_log_failure = ContactLogFailure.new(contact_log_failure_params)

    respond_to do |format|
      if @contact_log_failure.save
        format.html { redirect_to contact_log_failure_url(@contact_log_failure), notice: "Contact log failure was successfully created." }
        format.json { render :show, status: :created, location: @contact_log_failure }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @contact_log_failure.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contact_log_failures/1 or /contact_log_failures/1.json
  def update
    respond_to do |format|
      if @contact_log_failure.update(contact_log_failure_params)
        format.html { redirect_to contact_log_failure_url(@contact_log_failure), notice: "Contact log failure was successfully updated." }
        format.json { render :show, status: :ok, location: @contact_log_failure }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @contact_log_failure.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contact_log_failures/1 or /contact_log_failures/1.json
  def destroy
    @contact_log_failure.destroy

    respond_to do |format|
      format.html { redirect_to contact_log_failures_url, notice: "Contact log failure was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact_log_failure
      @contact_log_failure = ContactLogFailure.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def contact_log_failure_params
      params.require(:contact_log_failure).permit(:data, :error, :user_id, :log_file_id)
    end
end
