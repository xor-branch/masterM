
# @mentors = User.where(mentor: true)
# @mentors.each do |mentor|
#   avatar = Faker::Avatar.image
#   mentor.update(avatar: avatar)
# end

#projects = ['Mango', 'Pineapple', 'Passion fruit', 'Dragonfruit']
#projects.each{|project| Project.create(name: project, statut:0, start:"2021-08-25", deadline:"2021-08-30", description: "I am a good #{project}.")}

#categories = ['digital', 'business', 'arts', 'artisanat', 'soft_skil', 'language']
#categories.each{|category| Category.create(name:category)}
#
# #digital mentors
# 10.times do |n|
#   avatar = Faker::Avatar.image
#   name = Faker::Games::Pokemon.name
#   email = Faker::Internet.email
#   bio = Faker::Quote.jack_handey
#   password = "000000"
#   User.create!(name:name,
#                email:email,
#                avatar:avatar,
#                bio:bio,
#                speciality: "Digital Expert, web et logiciel",
#                password:password,
#                password_confirmation:password,
#                category: 1,
#                mentor: true
#   )
# end
# # # #business mentors
# 10.times do |n|
#   avatar = Faker::Avatar.image
#   name = Faker::Games::Pokemon.name
#   email = Faker::Internet.email
#   bio = Faker::Quote.jack_handey
#   password = "000000"
#   User.create!(name:name,
#                email:email,
#                avatar:avatar,
#                bio:bio,
#                speciality: "Expert en maketing et vente",
#                password:password,
#                password_confirmation:password,
#                category: 2,
#                mentor: true
#   )
# end
# # # #arts mentors
# 10.times do |n|
#   avatar = Faker::Avatar.image
#   name = Faker::Games::Pokemon.name
#   email = Faker::Internet.email
#   bio = Faker::Quote.jack_handey
#   password = "000000"
#   User.create!(name:name,
#                email:email,
#                avatar:avatar,
#                bio:bio,
#                speciality: "Designer",
#                password:password,
#                password_confirmation:password,
#                category: 3,
#                mentor: true
#   )
# end
# # # #artisanat mentors
# 10.times do |n|
#   avatar = Faker::Avatar.image
#   name = Faker::Games::Pokemon.name
#   email = Faker::Internet.email
#   bio = Faker::Quote.jack_handey
#   password = "000000"
#   User.create!(name:name,
#                email:email,
#                avatar:avatar,
#                bio:bio,
#                speciality: "Couturier professionnel",
#                password:password,
#                password_confirmation:password,
#                category: 4,
#                mentor: true
#   )
# end
# # # #soft_skil mentors
# 10.times do |n|
#   avatar = Faker::Avatar.image
#   name = Faker::Games::Pokemon.name
#   email = Faker::Internet.email
#   bio = Faker::Quote.jack_handey
#   password = "000000"
#   User.create!(name:name,
#                email:email,
#                avatar:avatar,
#                bio:bio,
#                speciality: "Specialiste en developpement personnel",
#                password:password,
#                password_confirmation:password,
#                category: 5,
#                mentor: true
#   )
# end
# # #language mentors
# 10.times do |n|
#   avatar = Faker::Avatar.image
#   name = Faker::Games::Pokemon.name
#   email = Faker::Internet.email
#   bio = Faker::Quote.jack_handey
#   password = "000000"
#   User.create!(name:name,
#                email:email,
#                avatar:avatar,
#                bio:bio,
#                speciality: "Anglais native",
#                password:password,
#                password_confirmation:password,
#                category: 6,
#                mentor: true
#   )
# end

# # # advisor user

  avatar = "'brand/blue.png'"
  name = "Advisor"
  email = "advisor@mastermind.io"
  bio = "Grandir ensemble"
  password = "000000"
  User.create!(name:name,
               email:email,
               avatar:avatar,
               bio:bio,
               speciality: "Master Mind Advisor",
               password:password,
               password_confirmation:password,
               advisor: true
  )
