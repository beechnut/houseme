# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :carrier do
    name "Verizon"
    email_suffix "vtext.com"
  end
end