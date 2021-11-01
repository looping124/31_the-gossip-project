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


#Création de 10 villes avec Faker
10.times do |index|
  City.create(name:Faker::Address.city)
end

#Création de 10 users
10.times do |index|
User.create(
  first_name:Faker::Name.first_name ,
  last_name:Faker::Name.last_name,
  description:Faker::Lorem.sentence(word_count: 5),
  email:Faker::Internet.email,
  age:rand(18..60),
  city:City.all[rand(0..City.all.size-1)]
)
puts "User #{index+1} créé"
end

#Création de 20gossips
20.times do |index|
  Gossip.create(title:Faker::Lorem.sentence(word_count: 3),content:Faker::Lorem.sentence(word_count: 10), user:User.all[rand(0..User.all.size-1)])
  puts "Gossip #{index+1} créé"
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
    Tagger.create(tag:Tag.all[rand(0...Tag.all.size)],gossip:gossip)
    puts "Tagger #{index+1} créé"
    index+=1
  end
end

#Création de 10 messages privés
10.times do |index|
   PrivateMessage.create(sender:User.all[rand(0...User.all.size)],recipient:User.all[rand(0...User.all.size)])
    puts "MP#{index+1} créé"
end

#On créé 20 commentaires de gossips
20.times do |index|
  Comment.create(content:Faker::Lorem.sentence(word_count: 4),commentable:Gossip.all[rand(0...Gossip.all.size)],user:User.all[rand(0...User.all.size)])
   puts "Comment de gossip#{index+1} créé"
end

#On créé 50 commentaires de commentaires
50.times do |index|
  Comment.create(content:Faker::Lorem.sentence(word_count: 4),commentable:Comment.all[rand(0...Comment.all.size)],user:User.all[rand(0...User.all.size)])
   puts "Comment de comment #{index+1} créé"
end

#On créé 20 likes de gossips
20.times do |index|
  Like.create(likeable:Gossip.all[rand(0...Gossip.all.size)])
   puts "Like de gossip #{index+1} créé"
end

#On créé 20 likes de commentaire
20.times do |index|
  Like.create(likeable:Comment.all[rand(0...Comment.all.size)])
   puts "Like de comment #{index+1} créé"
end