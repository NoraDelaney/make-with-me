# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

ArtType.find_or_create_by(name: "visual art")
ArtType.find_or_create_by(name: "writing")
ArtType.find_or_create_by(name: "music")
ArtType.find_or_create_by(name: "dance")
ArtType.find_or_create_by(name: "theater")
ArtType.find_or_create_by(name: "filmmaking")

50.times do |n|
    a = User.new
    a.first_name =  Faker::Name.first_name
    a.last_name = Faker::Name.last_name
    a.email =  Faker::Internet.email
    a.password = "password"
    a.password_confirmation = "password"
    a.city = Faker::Address.city
    a.state = Faker::Address.state
    a.description =  Faker::Lorem.paragraph
    a.profile_photo = Faker::Avatar.image
    a.username  = Faker::Internet.user_name
    a.website = Faker::Internet.url
    a.admin = false

    a.save
end

50.times do |n|
    a = UserArt.new
    a.user_id =  (rand(1..50)).to_i
    a.art_type_id =  (rand(1..7)).to_i

    a.save
end
