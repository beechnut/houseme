# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :housing_preference do
    user_id 1
    city_id 1
    housing_type "room"
    neighborhood 1
    min_rent 1
    max_rent 1
    bedrooms 1
    bathrooms 1
    additional_search_terms "MyString"
  end
end
