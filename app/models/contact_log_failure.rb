class ContactLogFailure < ApplicationRecord
  belongs_to :file_log
  belongs_to :user
end
