require 'faker'
require 'cloudinary'
require 'cloudinary/uploader'

puts "Cleaning database..."
User.destroy_all
Group.destroy_all

puts "Creating users..."

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

puts "#{User.count} users created"
# Create 5 groups

# Create some groupe_users

# Create 5 documents
puts "Creating groups..."
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

puts "#{Group.count} groups created"

puts "Creating documents..."
5.times do
  document = Document.new(
    title: Faker::Book.title,
    category: "Company"
  )

  group = Group.all.sample
  document.group = group
  document.user = group.users.sample
  document.save!
end
puts "#{Document.count} documents created"
