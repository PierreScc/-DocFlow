require 'faker'
require "open-uri"

puts "Cleaning database..."
User.destroy_all
Group.destroy_all

puts "Creating users..."
# icons = ["https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQqE3FvDvArNbK5DiMh88hYQgYfJqz8oM5xEw&s",
#          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSpzjtaLlYumGfxyzb1ipEckPEMJE1oPCmWfg&s",
#          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRAZbBJu2_ploZkylQSQcuVLrK_sUDbYVv00w&s",
#          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQyFeHQjv1xdW2PvI_xmNF9IFkEiBIxMtrN7g&s",
#          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRIfBrTzjblqtKxXgRcDV63uJjYq29SC9WvBg&s"]
# icons.each do |icon|
#   user = User.new(
#     username: Faker::Name.first_name,
#     email: Faker::Internet.email,
#     password: "123456"
#   )
#   file = URI.open(icon)
#   user.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
#   user.save!
# end

user = User.new(email: "victor@test.com", password: "123456", username: "Victor")
file = URI.open("https://avatars.githubusercontent.com/u/157797158?v=4")
user.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
user.save!

user = User.new(email: "diane@test.com", password: "123456", username: "Diane")
file = URI.open("https://ca.slack-edge.com/T02NE0241-UDF8DJTMM-7c86d3baa559-512")
user.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
user.save!

user = User.new(email: "denzel@test.com", password: "123456", username: "Denzel")
file = URI.open("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTjZep62a4fuAS_rUx9kjYk5TRBsVqsjQ-CWQ&s")
user.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
user.save!

rihanna = User.new(email: "rihanna@test.com", password: "123456", username: "Rihanna")
file = URI.open("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQrWn8rZENm5oOLxW46htiZAPxBjZ1KQdGIPhVjxPwFKKAKxz_TiF7uIV1D4Z5xZEj91DA&usqp=CAU")
rihanna.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
rihanna.save!

clement = User.new(email: "clement@test.com", password: "123456", username: "Clement")
file = URI.open("https://ca.slack-edge.com/T02NE0241-U06TGAB5T7C-7927c68befc2-512")
clement.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
clement.save!

user = User.new(email: "Ghali@test.com", password: "123456", username: "Ghali")
file = URI.open("https://ca.slack-edge.com/T02NE0241-U06U343CF9U-e4f83f86e924-512")
user.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
user.save!

user = User.new(email: "Thibault@test.com", password: "123456", username: "Thibault")
file = URI.open("https://ca.slack-edge.com/T02NE0241-U06ULG73AJV-82dbe6bd2b57-512")
user.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
user.save!

user = User.new(email: "Pierre@test.com", password: "123456", username: "Pierre")
file = URI.open("https://ca.slack-edge.com/T02NE0241-U06UND3AXA5-d9312ff54308-512")
user.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
user.save!
puts "#{User.count} users created"
# Create 5 groups

# Create some groupe_users

# Create 5 documents
puts "Creating groups..."
# companies = ["https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQR1O2az2LIgoyvNvyLkGJHe14jr029tk0Mxg&s",
#              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTdlliBN0cVBM-ejlCnKuxh_rRNKvaSJDrfqw&s",
#              "https://previews.123rf.com/images/priyosu/priyosu1801/priyosu180100054/93457442-b%C3%A2timent-et-b%C3%A2timent-logo-design-vectoriel-logo-immobilier-logo-de-conception-pour-les.jpg",
#              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSZU-UTqsX64zzjCZENRUtNSZj9YfCfIoltCQ&s",
#              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRqjXck8Fj7LGW2IXrO-RHHybHFZvc-X9TGJw&s"]

group = Group.new(title: "F&F Riri", category: "Professional")
group.save!
User.all.sample(3).each do |user|
  unless user == rihanna || user == clement
    user_group = UserGroup.new(
      user: user,
      group: group
    )
    user_group.save!
  end
end
UserGroup.create!(user: rihanna, group: group)
UserGroup.create!(user: clement, group: group)

group_1 = Group.new(title: "Sound Engineers", category: "Professional")
group_1.save!
User.all.sample(3).each do |user|
  unless user == clement
    user_group = UserGroup.new(
      user: user,
      group: group_1
    )
    user_group.save!
  end
end
UserGroup.create!(user: clement, group: group_1)

group_2 = Group.new(title: "Staff Prod", category: "Professional")
group_2.save!
User.all.sample(3).each do |user|
  unless user == clement
    user_group = UserGroup.new(
      user: user,
      group: group_2
    )
    user_group.save!
  end
end
UserGroup.create!(user: clement, group: group_2)


# companies.each do |company|
#   group = Group.new(
#     title: Faker::Company.department,
#     category: "Company"
#   )
#   file = URI.open(company)
#   group.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
#   group.save!

#   user_group = UserGroup.new(
#     user: User.all.sample,
#     group: group
#   )
#   user_group.save!
# end

puts "#{Group.count} groups created"

puts "Creating documents..."
photos = ["https://independant.io/wp-content/uploads/modele-devis-768x916.png",
          "https://www.zervant.com/fr/file/modele-de-devis/",
          "https://sm-devis.com/public/blog/wp-content/uploads/2019/10/exemple-de-devis-sm-devis-france.png",
          "https://assets.intia.fr/app/uploads/2020/09/exemple_devis_prestation-service.jpg",
          "https://templates.invoicehome.com/exemple-de-devis-fr-moderne-rouge-750px.png"]
photos.each do |photo|
  document = Document.new(
    title: Faker::Book.title,
    category: "Company"
  )

  group = Group.all.sample
  document.group = group
  document.user = group.users.sample
  file = URI.open(photo)
  document.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
  document.save!
end
puts "#{Document.count} documents created"
