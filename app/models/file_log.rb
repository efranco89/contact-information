class FileLog < ApplicationRecord
  belongs_to :user
  has_many :contact_log_failures
end
