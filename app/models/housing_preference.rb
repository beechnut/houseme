class HousingPreference < ActiveRecord::Base
  attr_accessible :additional_search_terms, :bathrooms, :bedrooms, :city_id, :city,
                  :housing_type, :max_rent, :min_rent, :neighborhood
  belongs_to :user
  has_many   :listings, dependent: :destroy
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :city

  HOUSING_TYPES = %w(room apartment)

  validates :user_id, presence: true
  validates :city_id, presence: true
  validates :bathrooms, numericality: { only_integer: true }, allow_blank: true
  validates :bedrooms,  numericality: { only_integer: true }, allow_blank: true
  validates :min_rent,  numericality: { only_integer: true }, allow_blank: true
  validates :max_rent,  numericality: { only_integer: true }, allow_blank: true
  validates :neighborhood,  numericality: { only_integer: true }, allow_blank: true
  validates :housing_type, presence: true, inclusion: { :in => HOUSING_TYPES }

end
