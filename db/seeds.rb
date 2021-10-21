# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Path.destroy_all 

data = 
[
    {
        "x": 262.203125,
        "y": 27.203125
    },
    {
        "x": 262.203125,
        "y": 29.203125
    },
    {
        "x": 262.203125,
        "y": 31.203125
    },
    {
        "x": 263.203125,
        "y": 33.203125
    },
    {
        "x": 263.203125,
        "y": 35.203125
    },
    {
        "x": 264.203125,
        "y": 38.203125
    },
    {
        "x": 265.203125,
        "y": 41.203125
    },
    {
        "x": 267.203125,
        "y": 43.203125
    },
    {
        "x": 268.203125,
        "y": 46.203125
    },
    {
        "x": 271.203125,
        "y": 48.203125
    },
    {
        "x": 274.203125,
        "y": 51.203125
    },
    {
        "x": 278.203125,
        "y": 53.203125
    },
    {
        "x": 283.203125,
        "y": 55.203125
    },
    {
        "x": 289.203125,
        "y": 55.203125
    },
    {
        "x": 295.203125,
        "y": 56.203125
    },
    {
        "x": 300.203125,
        "y": 56.203125
    },
    {
        "x": 306.203125,
        "y": 55.203125
    },
    {
        "x": 312.203125,
        "y": 54.203125
    },
    {
        "x": 319.203125,
        "y": 52.203125
    },
    {
        "x": 324.203125,
        "y": 50.203125
    },
    {
        "x": 327.203125,
        "y": 49.203125
    },
    {
        "x": 330.203125,
        "y": 48.203125
    },
    {
        "x": 332.203125,
        "y": 47.203125
    }
]

a = 0
while a<data.length
    Path.create(x:data[a][:x],y:data[a][:y])
    puts "a = #{a}"
    a +=1
end 




puts 'DONE SEEDING'