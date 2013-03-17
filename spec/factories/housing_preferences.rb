# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :housing_preference do
    city_id 1
    neighborhood 1
    apartment_type "MyString"
    additional_search_terms "MyString"
    bedrooms "MyString"
    bathrooms "MyString"
    min_rent 1
    max_rent 1
  end
end
