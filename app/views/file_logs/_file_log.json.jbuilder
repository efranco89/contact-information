json.extract! file_log, :id, :status, :user_id, :errors, :file_name, :created_at, :updated_at
json.url file_log_url(file_log, format: :json)
