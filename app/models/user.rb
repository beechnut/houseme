class User < ActiveRecord::Base
  attr_accessible :carrier, :email, :mobile, :name, 
                  :password, :password_confirmation,
                  :receive_text
  has_secure_password
  has_many :microposts
  has_many :housing_preferences
  
  before_save { |user| user.email = email.downcase }
  before_save :create_remember_token

  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true

  validates_presence_of :mobile,  :if => :receive_text?
  validates_presence_of :carrier, :if => :receive_text?
  validates_presence_of :mobile,  :if => :carrier
  validates_presence_of :carrier, :if => :mobile
  validates :carrier, :inclusion => { :in => %w(Alltel AT&T Boost Sprint T-Mobile Verizon) },
            allow_blank: true

  validates_length_of :mobile, minimum: 10, maximum: 10, allow_blank: true

  private

    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end

end