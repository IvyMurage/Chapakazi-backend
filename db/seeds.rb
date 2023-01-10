puts "👨‍💻👨‍💻 job seeding!!"
10.times do
  Customer.create(username: Faker::Name.name, image: Faker::Avatar.image, password: "123", password_confirmation: "123", location: "Nairobi, Kenya")
end

10.times do
  customer_id = Customer.order("RANDOM()").first.id
  Job.create(title: Faker::Job.field, description: Faker::Lorem.characters(number: 150), budget: "$#{rand(20..49)}-$#{rand(50..100)}", customer_id: customer_id)
end

puts "👨‍💻👨‍💻 end of job seeding!!"

Handyman.create(username: "JOhn Doe",
                password: "123",
                password_confirmation: "123",
                location: "Nairobi,Kenya",
                image: "https://img.freepik.com/free-photo/carpenter-cutting-plank-by-circular-saw_329181-3731.jpg?w=740&t=st=1672677374~exp=1672677974~hmac=79257539772412f447b7f9d73b6f04d0160fa9ae7f3fdbdb5b03dcc60621d6e2",
                rating: "$12-$30",
                speciality: "Capentry",
                description: Faker::Lorem.characters(number: 100),
                admin_id: 1)

puts "Review seeding"
Review.create(comment: Faker::Lorem.sentence, customer_id: Customer.first.id, handyman_id: Handyman.first.id)
Review.create(comment: Faker::Lorem.sentence, customer_id: Customer.second.id, handyman_id: Handyman.first.id)
Review.create(comment: Faker::Lorem.sentence, customer_id: Customer.third.id, handyman_id: Handyman.first.id)
Review.create(comment: Faker::Lorem.sentence, customer_id: Customer.fourth.id, handyman_id: Handyman.first.id)
Review.create(comment: Faker::Lorem.sentence, customer_id: Customer.fifth.id, handyman_id: Handyman.first.id)
puts "End of Review seeding"

puts "Message seeding"

puts "End of Message seeding"