# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :city do
    name "Austin"
    neighborhoods ["Far West", "South Campus", "Hyde Park"]
    craigslist_prefix "austin"
  end
end