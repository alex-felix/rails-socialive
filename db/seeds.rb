# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Livestream.destroy_all
User.destroy_all

user1 = User.create({
  email: 'remi.dyvoire@gmail.com',
  password: '123456',
  })

user2 = User.create({
  email: 'sandrine@gmail.com',
  password: '123456',
  })

livestream1 = Livestream.create({
  title: 'How to cook like a pro',
  category: 'food',
  })

livestream2 = Livestream.create({
  title: 'Morning yoga with Sandrine',
  category: 'fitness',
  })

livestream1.user = user1
livestream2.user = user2

user1.save!
user2.save!

livestream1.save!
livestream2.save!


