class Carrier < ActiveHash::Base
  fields :name, :email_suffix

  include ActiveHash::Associations
  belongs_to :users

  include ActiveModel::Validations
  validates :name, presence: true
  VALID_SUFFIX_REGEX = /[^@]+\.[^@]{2,}$/
  validates :email_suffix, presence: true, format: { with: VALID_SUFFIX_REGEX }

  create id: 1, name: "Verizon",  email_suffix: "vtext.com"
  create id: 2, name: "T-Mobile", email_suffix: "tmomail.net"
  create id: 3, name: "Alltel",   email_suffix: "message.alltel.com"
  create id: 4, name: "Sprint",   email_suffix: "messaging.sprintpcs.com"
  create id: 5, name: "AT&T",     email_suffix: "txt.att.net"
end
