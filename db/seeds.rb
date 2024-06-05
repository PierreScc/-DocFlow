require 'faker'
require "open-uri"

puts "Cleaning database..."
User.destroy_all
Group.destroy_all

puts "Creating users..."
icons = ["https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRN9J7KeLhBzPJQmdTpaYSD4Jdz5o3FpfkXIw&s",
         "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSpzjtaLlYumGfxyzb1ipEckPEMJE1oPCmWfg&s",
         "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRAZbBJu2_ploZkylQSQcuVLrK_sUDbYVv00w&s",
         "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTZa8k1fDzhwxQO63o0Pv--JZ4QwVxftBhFTw&s",
         "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQmhxeR7TgQyYFK29R0tbq_IkCoZO1FE19HBA&s"]
icons.each do |icon|
  user = User.new(
    username: Faker::Name.name,
    email: Faker::Internet.email,
    password: "123456"
  )
  file = URI.open(icon)
  user.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
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
companies = ["https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQR1O2az2LIgoyvNvyLkGJHe14jr029tk0Mxg&s",
             "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTdlliBN0cVBM-ejlCnKuxh_rRNKvaSJDrfqw&s",
             "https://previews.123rf.com/images/priyosu/priyosu1801/priyosu180100054/93457442-b%C3%A2timent-et-b%C3%A2timent-logo-design-vectoriel-logo-immobilier-logo-de-conception-pour-les.jpg",
             "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSZU-UTqsX64zzjCZENRUtNSZj9YfCfIoltCQ&s",
             "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRqjXck8Fj7LGW2IXrO-RHHybHFZvc-X9TGJw&s"]

companies.each do |company|
  group = Group.new(
    title: Faker::Company.department,
    category: "Company"
  )
  file = URI.open(company)
  group.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
  group.save!

  user_group = UserGroup.new(
    user: User.all.sample,
    group: group
  )
  user_group.save!
end

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
