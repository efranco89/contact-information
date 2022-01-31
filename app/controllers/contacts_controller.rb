class ContactsController < ApplicationController
  before_action :set_contact, only: %i[ show edit update destroy ]

  # GET /contacts or /contacts.json
  def index
    @contacts = Contact.where(user_id: current_user.id).order(:name).paginate(page: params[:page], per_page: 15)
  end

  def import
    respond_to do |format|
      unless  params[:contacts].nil?
        files = params[:contacts][:files]
        # first saves the files in tmp
        files_to_send = []
        files.each do | file |
          file_path = "/tmp/#{SecureRandom.hex}.csv"
          File.write(file_path, File.open(file, "r:UTF-8").read)
          files_to_send << file_path
        end
        ImportsContactsJob.perform_later(
          files: files_to_send, user: current_user
        )
        format.html { redirect_to contacts_path, notice: 'The contacts files are being processed' }
      else
        format.html { redirect_to contacts_path, alert: 'You did not select any file' }
      end
    end
  end

  # GET /contacts/1 or /contacts/1.json
  def show
  end

  # GET /contacts/new
  def new
    @contact = Contact.new
  end

  # GET /contacts/1/edit
  def edit
  end

  # POST /contacts or /contacts.json
  def create
    @contact = Contact.new(contact_params)

    respond_to do |format|
      if @contact.save
        format.html { redirect_to contact_url(@contact), notice: "Contact was successfully created." }
        format.json { render :show, status: :created, location: @contact }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contacts/1 or /contacts/1.json
  def update
    respond_to do |format|
      if @contact.update(contact_params)
        format.html { redirect_to contact_url(@contact), notice: "Contact was successfully updated." }
        format.json { render :show, status: :ok, location: @contact }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contacts/1 or /contacts/1.json
  def destroy
    @contact.destroy

    respond_to do |format|
      format.html { redirect_to contacts_url, notice: "Contact was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    # def set_contact
    #   @contact = Contact.find(params[:id])
    # end
    #
    # # Only allow a list of trusted parameters through.
    # def contact_params
    #   params.require(:contact).permit(:name, :birthday, :phone, :address, :credit_card, :franchise, :email, :user_id)
    # end
end
