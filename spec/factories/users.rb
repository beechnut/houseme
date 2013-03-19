FactoryGirl.define do
  factory :user do
    name    "Matt Cloyd"
    email   "cloydster@gmail.com"
    receive_text false
    password "password"
    password_confirmation "password"
  end
end