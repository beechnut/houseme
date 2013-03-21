class HousingPreference < ActiveRecord::Base
  attr_accessible :additional_search_terms, :bathrooms, :bedrooms, :city_id,
                  :housing_type, :max_rent, :min_rent, :neighborhood
  belongs_to :user
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :city

  validates :user_id, presence: true
  validates :city_id, presence: true
  validates :bathrooms, numericality: { only_integer: true }, allow_blank: true
  validates :bedrooms,  numericality: { only_integer: true }, allow_blank: true
  validates :min_rent,  numericality: { only_integer: true }, allow_blank: true
  validates :max_rent,  numericality: { only_integer: true }, allow_blank: true

end
