require 'faker'

User.delete_all

5.times do
  user = User.new(
    username: Faker::Name.name,
    email: Faker::Internet.email,
    password: "123456"
  )
  user.save!
end

User.create(email: "clement@test.com", password: "123456", username: "Clement")
User.create(email: "Ghali@test.com", password: "123456", username: "Ghali")
User.create(email: "Thibault@test.com", password: "123456", username: "Thibault")
User.create(email: "Pierre@test.com", password: "123456", username: "Pierre")
