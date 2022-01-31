class DateTransformer
  def self.call(date)
    Date.strptime(date, '%m/%d/%y')
  end
end
