class ImportContactCvs

  def self.starts_import(file_log:, file_path:, current_user:)
    import = ContacterImport.new(path: file_path) do
      after_build do |contact|
        contact.user_id = current_user.id
      end
    end

    unless import.valid_header?
      returns_header_error(file_log: file_log, import: import)
    else

      file_log.status = 'Processing'
      file_log.save
      import.run!

      if import.report.success?
        message = 'All The contacts has been imported'
      else
        message = 'File processed with error please check log'
        failed_rows = import.report.invalid_rows.map { |row|
          [row.line_number, row.model.to_json, row.errors]
        }
        failed_rows.each do | failed_row |
          ContactLogFailure.create(
            data: failed_row[1],
            error: failed_row[2].map { |k, v| "#{k}: #{v}" }.join(', '),
            error_line: failed_row[0],
            user_id: current_user.id,
            file_log_id: file_log.id
          )
        end
      end

      file_log.status = 'Finished'
      file_log.message = message
      file_log.save
      return [true, message]
    end

  end

  def self.returns_header_error(file_log:, import:)
    error_message = "The file headers are invalid #{import.report.message}"
    file_log.status = 'Failed'
    file_log.message = error_message
    file_log.save
    return [false, error_message]
  end

end
