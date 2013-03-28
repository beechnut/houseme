# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :listing do
    title "Charming four-bedroom in someplace."
    url "http://boston.craigslist.org/gbs/aap/01328jfq894.html"
    respond_email "cl-0129384@craigslist.com"
    bedrooms 1
    cost 1
    housing_preference_id 1
  end
end
