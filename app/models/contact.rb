class Contact < ApplicationRecord
  belongs_to :user
  validates_presence_of :address, :birthday, :credit_card, :email, :franchise, :name, :phone
end
