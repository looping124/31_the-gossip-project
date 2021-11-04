# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.destroy_all
City.destroy_all
Gossip.destroy_all
Tag.destroy_all
PrivateMessage.destroy_all
Comment.destroy_all
Like.destroy_all
Faker::Config.locale = 'fr'
cities_array=["Paris","Marseille","Lyon","Toulouse","Nice","Nantes","Strasbourg","Montpellier","Bordeaux","Lille"]

#Création de 10 villes 
cities_array.each do |city|
  City.create(name:city)
end
#Création de anonymous
User.create(
  first_name:"el" ,
  last_name:"Anonymous",
  description:Faker::Lorem.sentence(word_count: 5),
  email:"anonymous@gmail.com",
  age:rand(18..60),
  city:City.all.sample,
  password: "Anonymous"
)

#Création de 10 users
10.times do |index|
  last_name_faker = Faker::Name.last_name
userx = User.create(
  first_name:Faker::Name.first_name ,
  last_name:last_name_faker,
  description:Faker::Lorem.sentence(word_count: 5),
  email:"#{last_name_faker}@gmail.com",
  age:rand(18..60),
  city:City.all.sample,
  password: last_name_faker
)
puts "User #{userx.id} créé"
end

#Création de 20gossips
20.times do |index|
  gossipx = Gossip.create(title:Faker::Lorem.sentence(word_count: 2),content:Faker::Lorem.sentence(word_count: 10), user:User.all.sample)
end

#Création de 10 tags
10.times do |index|
  Tag.create(title:Faker::Emotion.unique.noun)
    puts "Tag #{index+1} créé"
end

#Création de 1 à 3 tags par gossip
index = 0
Gossip.all.each do |gossip|
  nb_of_tags = rand(1..3)
  nb_of_tags.times do
    Tagger.create(tag:Tag.all.sample,gossip:gossip)
    puts "Tagger #{index+1} créé"
    index+=1
  end
end

#Création de 10 messages privés
10.times do |index|
   PrivateMessage.create(sender:User.all.sample,recipient:User.all[rand(0...User.all.size)])
    puts "MP#{index+1} créé"
end

#On créé 20 commentaires de gossips
20.times do |index|
 
  Comment.create(content:Faker::Lorem.sentence(word_count: 4),commentable:Gossip.all.sample,user:User.all.sample)
   puts "Comment de gossip#{index+1} créé"
end

#On créé 50 commentaires de commentaires
50.times do |index|
  Comment.create(content:Faker::Lorem.sentence(word_count: 4),commentable:Comment.all[rand(0...Comment.all.size)],user:User.all[rand(0...User.all.size)])
   puts "Comment de comment #{index+1} créé"
end

#On créé 20 likes de gossips
20.times do |index|
  Like.create(likeable:Gossip.all.sample, user:User.all.sample)
   puts "Like de gossip #{index+1} créé"
end

#On créé 20 likes de commentaire
20.times do |index|
  Like.create(likeable:Comment.all.sample, user:User.all.sample)
   puts "Like de comment #{index+1} créé"
end