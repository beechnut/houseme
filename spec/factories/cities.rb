# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :city do
    name "Austin"
    neighborhoods ["MyString"]
    craigslist_prefix "austin"
  end
end