class ImportsContactsJob < ApplicationJob
  queue_as :default

  def perform(files:, user:)
    # Rails.logger.info("This are the args: #{args}")
    files.each do | file |
      Rails.logger.info("Performing job for file: #{file}")
      file_log = FileLog.new
      file_log.status = 'On Hold'
      file_log.user_id = user.id
      file_log.save
      ImportContactCvs.starts_import(
        file_log: file_log,
        file_path: file,
        current_user: user
      )
    end
  end
end
