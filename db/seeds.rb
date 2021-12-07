# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
words = [ "ball","cake","storm",
    "sea","toast","ship",
    "fence","tree","trumpet",
    "jail","goat"]
x = 0    
while x < words.length
   Word.create(word:words[x])
   x+=1
end 


Room.create(name:'room_1')
Room.create(name:'room_2')

puts 'DONE SEEDING'
