class Contact < ApplicationRecord
  belongs_to :user
  validates_presence_of :address, :birthday, :credit_card, :email, :franchise, :name, :phone

  # validates date format to ISO 8601
  DATE_FORMAT_SLASH = %r'(-?(?:[1-9][0-9]*)?[0-9]{4})-(1[0-2]|0[1-9])-(3[0-1]|0[1-9]|[1-2][0-9])'
  # DATE_FORMAT_HYPHEN = /^(-?(?:[1-9][0-9]*)?[0-9]{4})\/(1[0-2]|0[1-9])\/(3[0-1]|0[1-9]|[1-2][0-9])$/
  DATE_FORMAT_HYPHEN = %r'(-?(?:[1-9][0-9]*)?[0-9]{4})\/(1[0-2]|0[1-9])\/(3[0-1]|0[1-9]|[1-2][0-9])'
  VALID_DATE_FORMAT = /\A(#{DATE_FORMAT_SLASH}|#{DATE_FORMAT_HYPHEN})\z/
  validates :birthday, format: {
    with: VALID_DATE_FORMAT,
    message: 'The date format for birthday must be ISO 8601 %YYYY-%MM-%DD'
  }

  validates :email, format: {
    with: Devise.email_regexp,
    message: 'The email is invalid please check the format'
  }

  validates :name, format: {
    with: %r'\A[a-zA-Z\s\-]+\z',
    message: 'The name format is invalid, names only contains letter, the - is the uniq special character allow'
  },
  length: {
    minimum: 3,
    maximum: 255,
    message: "The name must be between 3 to 255 characters"
  }

  PHONE_NUMBER_FORMAT_ONE = %r'\(\+[0-9]{2}\)\s[0-9]{3}\s[0-9]{3}\s[0-9]{2}\s[0-9]{2}\s[0-9]{2}'
  PHONE_NUMBER_FORMAT_TWO = %r'\(\+[0-9]{2}\)\s[0-9]{3}\s[0-9]{3}\s[0-9]{2}\s[0-9]{2}'
  VALID_PHONE_FORMAT = /\A(#{PHONE_NUMBER_FORMAT_ONE}|#{PHONE_NUMBER_FORMAT_TWO})\z/
  validates :phone, format: {
    with: VALID_PHONE_FORMAT,
    message: "The phone number format is invalid, allowed format are (+00) 000 000 00 00 00 or (+00) 000 000 00 00"
  }


end
