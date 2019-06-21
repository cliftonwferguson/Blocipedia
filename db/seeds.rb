# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

 require 'random_data'

 user = User.create!(
  email: "seeds@email.com", 
  password: "password"
 	)


 50.times do
 	Wiki.create!(
      
      title:  Random.alphanumeric,
      body:   Random.paragraphs,
      user: user
 		)

  end
 	 
 	 puts "Seed Finished"
 	 puts "#{Wiki.count} wiki created"

 