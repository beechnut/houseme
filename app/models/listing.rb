class Listing < ActiveRecord::Base
  attr_accessible :bedrooms, :cost, :housing_preference_id,
                  :respond_email, :title, :url, :user_id

  has_one :user
  belongs_to :housing_preference

  validates :title,         presence: true
  validates :url,           presence: true
  validates :respond_email, presence: true
  validates :bedrooms, numericality: { only_integer: true }
  validates :cost, numericality: { only_integer: true }
  validates :housing_preference_id, numericality: { only_integer: true }

end
