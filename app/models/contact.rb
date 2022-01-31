class Contact < ApplicationRecord

  before_validation :sets_credit_card_franchise
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

  def sets_credit_card_franchise
    franchises = [
      {
        issuer: "American Express",
        regex: %r'\A(34|37)\d{13}'
      },
      {
        issuer: "China T-Union",
        regex: %r'\A(31)\d{17}\z'
      },
      {
        issuer: "China UnionPay",
        regex: %r'\A(62)\d{14,17}\z'
      },
      {
        issuer: "Dankort",
        regex: %r'\A(5019|4571)\d{12}\z'
      },
      {
        issuer: "Diners Club International",
        regex: %r'\A(36)\d{12,17}\z'
      },
      {
        issuer: "Diners Club United States & Canada",
        regex: %r'\A(54)\d{14}\z'
      },
      {
        issuer: "Discover Card",
        regex: %r'\A(6011)\d{12,15}\z'
      },
      {
        issuer: "Discover Card",
        regex: %r'\A(644|645|646|647|648|649)\d{13,16}\z'
      },
      {
        issuer: "Discover Card",
        regex: %r'\A(65)\d{14,17}\z'
      },
      {
        issuer: "Discover Card",
        regex: %r'\A^(622(12[6-9]|2[0-9]{2}|3[0-9]{2}|4[0-9]{2}|5[0-9]{2}|6[0-9]{2}|7[0-9]{2}|8[0-9]{2}|9[0-5]{2})\d{10,13})$\z'
      },
      {
        issuer: "GPN",
        regex: %r'\A(1|6)\d{15}\z'
      },
      {
        issuer: "Humo",
        regex: %r'\A(9860)\d{12}\z'
      },
      {
        issuer: "InstaPayment",
        regex: %r'\A(637|638|639)\d{13}\z'
      },
      {
        issuer: "InstaPayment",
        regex: %r'\A(636)\d{13,16}\z'
      },
      {
        issuer: "JCB",
        regex: %r'\A35(2[8-9]|3[0-9]|4[0-9]|5[0-9]|6[0-9]|7[0-9]|8[0-9]|)\z'
      },
      {
        issuer: "LankaPay",
        regex: %r'\A(357111)\d{10}\z'
      },
      {
        issuer: "Maestro",
        regex: %r'\A(5018|5020|5038|5893|6304|6759|6761|6762|6763)\d{8,15}\z'
      },
      {
        issuer: "Maestro UK",
        regex: %r'\A(6759)\d{8,15}\z'
      },
      {
        issuer: "Maestro UK",
        regex: %r'\A(676770|676774)\d{8,15}\z'
      },
      {
        issuer: "Mastercard",
        regex: %r'\A2(2[1-9]{2}|3[0-9]{2}|4[0-9]{2}|5[0-9]{2}|6[0-9]{2}|720)\d{14}\z'
      },
      {
        issuer: "Mastercard",
        regex: %r'\A(51|52|53|54|55)\d{14}\z'
      },
      {
        issuer: "Mir",
        regex: %r'\A(2200|2201|2202|2203|2204)\d{12,15}\z'
      },
      {
        issuer: "NPS Pridnestrovie",
        regex: %r'\A(6054740|6054741|6054742|6054743|6054744)\d{9}\z'
      },
      {
        issuer: "RuPay",
        regex: %r'((60|65|81|82)\d{14})'
      },
      {
        issuer: "RuPay",
        regex: %r'\A(508|353|356)\d{13}\z'
      },
      {
        issuer: "Troy",
        regex: %r'\A(65)\d{14}\z'
      },
      {
        issuer: "Troy",
        regex: %r'\A(9792)\d{12}\z'
      },
      {
        issuer: "UATP",
        regex: %r'\A(1)\d{14}\z'
      },
      {
        issuer: "UkrCard",
        regex: %r'\A(60400100|60420099)\d{8,11}\z'
      },
      {
        issuer: "UkrCard",
        regex: %r'\A(8600)\d{14}\z'
      },
      {
        issuer: "Verve",
        regex: %r'\A506(0[9-9]{2}|1[0-9][0-8])\d{10,13}\z'
      },
      {
        issuer: "Verve",
        regex: %r'\A6500(0[2-9]|1[0-9]|2[0-7])\d{10,13}\z'
      },
      {
        issuer: "Visa",
        regex: %r'\A(4)\d{12,15}\z'
      },
      {
        issuer: "Visa Electron",
        regex: %r'\A(4026|4508|4844|4913|4917)\d{12}\z'
      },
      {
        issuer: "Visa Electron",
        regex: %r'\A(417500)\d{10}\z'
      },
    ]
    contact_franchise = franchises.select { |franchise|
      franchise if self.credit_card.match(franchise[:regex])
    }.first
    unless contact_franchise.nil?
      self.franchise = contact_franchise[:issuer]
    else
      errors.add(:franchise, "The credit card number is incorrect, please verify")
    end
  end




end
