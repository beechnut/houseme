FactoryGirl.define do
  factory :user do
    name    "Matt Cloyd"
    email   "cloydster@gmail.com"
    mobile  "5087692973"
    carrier "Verizon"
    receive_text true
    password "password"
    password_confirmation "password"
  end
end