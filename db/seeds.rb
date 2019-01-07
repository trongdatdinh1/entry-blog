User.create!(name:  "Shikamarus",
  email: "shika@gmail.com",
  password: "123123",
  password_confirmation: "123123")

50.times do |n|
  name = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "123123"
  User.create!(name:  name,
    email: email,
    password: password,
    password_confirmation: password)
end
