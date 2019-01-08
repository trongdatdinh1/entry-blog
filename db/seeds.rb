User.create!(name:  "Red User",
  email: "user@gmail.com",
  password: "123123",
  password_confirmation: "123123")

50.times do |n|
  name = Faker::Name.name
  email = "user-#{n+1}@gmail.com"
  password = "123123"
  User.create!(name:  name,
    email: email,
    password: password,
    password_confirmation: password)
end

users = User.order(:created_at).take(6)
50.times do
  title = Faker::Pokemon.name
  body = Faker::Lorem.sentence(5)
  users.each { |user| user.blogs.create!(title: title, body: body) }
end
