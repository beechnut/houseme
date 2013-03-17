class HousingPreference < ActiveRecord::Base
  attr_accessible :additional_search_terms, :apartment_type, :bathrooms, :bedrooms, :max_rent, :min_rent, :neighborhood
  belongs_to :user

  validates :user_id, presence: true
end
