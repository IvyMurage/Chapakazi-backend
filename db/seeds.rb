# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "👨‍💻👨‍💻 job seeding!!"
10.times do
  Customer.create(username: Faker::Name.name, image: Faker::Avatar.image, password: "123", password_confirmation: "123", location: "Nairobi, Kenya")
end

10.times do
  customer_id = Customer.order("RANDOM()").first.id
  Job.create(title: Faker::Job.field, description: Faker::Lorem.characters(number: 150), budget: "$#{rand(20..49)}-$#{rand(50..100)}", customer_id: customer_id)
end

puts "👨‍💻👨‍💻 end of job seeding!!"

puts "Review seeding"
customer_id = Customer.order("RANDOM()").first.id
10.times do
  Review.create(customer_id: customer_id, comment: Faker::Lorem.sentence, handyman_id: 3)
end
puts "End of Review seeding"
