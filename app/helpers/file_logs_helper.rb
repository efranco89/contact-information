module FileLogsHelper

  def returns_row_status_color(status:)

    case status
    when 'Failed'
      color = "table-danger"
    when 'Finished'
      color = "table-success"
    when 'On Hold'
      color = "table-warning"
    when 'Processing'
      color = "table-info"
    else
      color = "table-primary"
    end
    return color
  end
end
