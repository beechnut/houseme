class User < ActiveRecord::Base
  attr_accessible :carrier, :email, :mobile, :name, 
                  :password, :password_confirmation,
                  :receive_text, :active
  has_secure_password
  has_many :microposts
  has_many :housing_preferences
  has_many :listings, through: :housing_preferences
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :carrier
  
  before_validation { |user| user.mobile = user.mobile.gsub(/\D/,'') unless mobile.nil? }
  before_save { |user| user.email = email.downcase }
  before_save :create_remember_token

  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }, :if => lambda{ new_record? || !password.nil? }
  validates :password_confirmation, presence: true, :if => lambda{ new_record? || !password.nil? }

  validates :mobile, presence: true, :if => "receive_text? or !carrier_id.nil?"
  validates :carrier_id, presence: true, :if => "receive_text? or !mobile.blank?"
  validates :mobile, length: { is: 10 }, allow_blank: true

  def text_address
    if user.mobile?
      "#{user.mobile}@#{user.carrier.email_suffix}"
    end
  end

  def listing_count
    if user.housing_preferences.any?
      @count = 0
      user.housing_preferences.each do |pref|
        @count += pref.listings.count
      end
    end
    return @count
  end

  private

    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end

end