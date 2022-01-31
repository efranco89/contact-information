class FileLogsController < ApplicationController
  before_action :set_file_log, only: %i[ show edit update destroy ]

  # GET /file_logs or /file_logs.json
  def index
    @file_logs = FileLog.all
  end

  # GET /file_logs/1 or /file_logs/1.json
  def show
  end

  # GET /file_logs/new
  def new
    @file_log = FileLog.new
  end

  # GET /file_logs/1/edit
  def edit
  end

  # POST /file_logs or /file_logs.json
  def create
    @file_log = FileLog.new(file_log_params)

    respond_to do |format|
      if @file_log.save
        format.html { redirect_to file_log_url(@file_log), notice: "File log was successfully created." }
        format.json { render :show, status: :created, location: @file_log }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @file_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /file_logs/1 or /file_logs/1.json
  def update
    respond_to do |format|
      if @file_log.update(file_log_params)
        format.html { redirect_to file_log_url(@file_log), notice: "File log was successfully updated." }
        format.json { render :show, status: :ok, location: @file_log }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @file_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /file_logs/1 or /file_logs/1.json
  def destroy
    @file_log.destroy

    respond_to do |format|
      format.html { redirect_to file_logs_url, notice: "File log was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_file_log
      @file_log = FileLog.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def file_log_params
      params.require(:file_log).permit(:status, :user_id, :errors, :file_name)
    end
end
