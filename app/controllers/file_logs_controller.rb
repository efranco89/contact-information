class FileLogsController < ApplicationController
  before_action :set_file_log, only: %i[ show edit update destroy ]

  # GET /file_logs or /file_logs.json
  def index
    @file_logs = FileLog.where(user_id: current_user.id).paginate(page: params[:page], per_page: 15)
  end

  private

end
