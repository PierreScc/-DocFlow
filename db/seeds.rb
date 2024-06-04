require 'faker'

User.delete_all
Document.delete_all

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

# Create 5 groups

# Create some groupe_users

# Create 5 documents

5.times do
  group = Group.new(
    title: Faker::Company.department,
    category: "Company"
  )
  group.save!

  user_group = UserGroup.new(
    user: User.all.sample,
    group: group
  )
  user_group.save!
end

5.times do
  document = Document.new(
    title: Faker::Book.title,
    category: "Company"
  )
  document.user = User.all.sample

  document.save!
end
