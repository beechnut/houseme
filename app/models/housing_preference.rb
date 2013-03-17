class HousingPreference < ActiveRecord::Base
  attr_accessible :additional_search_terms, :bathrooms, :bedrooms, :city_id,
                  :housing_type, :max_rent, :min_rent, :neighborhood
  belongs_to :user
  belongs_to :city

  validates :user_id, presence: true
end
