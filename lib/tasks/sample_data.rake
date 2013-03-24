namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    User.create!(name: "Matt Cloyd",
                 email: "cloydster@gmail.com",
                 password: "foobar",
                 password_confirmation: "foobar")
    30.times do |n|
      name = Faker::Name.name
      email = "example-#{n+1}@houseme.com"
      password = "password"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end

    users = User.all(limit: 20)
    city = City.find 1
    2.times do
      bedrooms = rand(1..6)
      bathrooms = rand(1..4)
      housing_type = ["apartment", "room"][rand(0..1)]
      min_rent = [200, 300, 400, 500][rand(0..3)]
      max_rent = [900, 1000, 1400, 1500][rand(0..3)]
      users.each { |user| user.housing_preferences.create!(bedrooms: bedrooms,
                                                           bathrooms: bathrooms,
                                                           city: city,
                                                           housing_type: housing_type,
                                                           min_rent: min_rent,
                                                           max_rent: max_rent) }
    end
  end
end