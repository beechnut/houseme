# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :city do
    name "MyString"
    neighborhoods "MyString"
    craigslist_prefix "MyString"
  end
end
