puts "👨‍💻👨‍💻 job seeding!!"

Customer.create(username: Faker::Name.name,
                image: "https://randomuser.me/api/portraits/women/3260.jpg",
                password: "12345678",
                password_confirmation: "12345678",
                location: "Langata, Nairobi West",
                admin_id: 1)

Customer.create(username: Faker::Name.name,
                image: "https://randomuser.me/api/portraits/men/2603.jpg",
                password: "12345678",
                password_confirmation: "12345678",
                location: "Thika, Nairobi",
                admin_id: 1)

Customer.create(username: Faker::Name.name,
                image: " https://randomuser.me/api/portraits/women/62.jpg",
                password: "12345678",
                password_confirmation: "12345678",
                location: "Roysambu, Nairobi",
                admin_id: 1)

Customer.create(username: Faker::Name.name,
                image: "https://randomuser.me/api/portraits/men/80.jpg",
                password: "12345678",
                password_confirmation: "12345678",
                location: "Kiambaa, Kiambu",
                admin_id: 1)

Customer.create(username: Faker::Name.name,
                image: "https://randomuser.me/api/portraits/women/69.jpg",
                password: "12345678",
                password_confirmation: "12345678",
                location: "Umoja, Eastlands",
                admin_id: 1)

10.times do
  customer_id = Customer.order("RANDOM()").first.id
  Job.create(title: Faker::Job.field, description: Faker::Lorem.paragraph_by_chars(number: 1000), budget: "$#{rand(20..49)}-$#{rand(2600..260)}", customer_id: customer_id)
end

puts "👨‍💻👨‍💻 end of job seeding!!"

Handyman.create(username: "John Wilson",
                password: "12345678",
                email: "john@gmail.com",
                password_confirmation: "12345678",
                location: "Umoja, Nairobi",
                image: "https://img.freepik.com/free-photo/carpenter-cutting-plank-by-circular-saw_329181-3731.jpg?w=740&t=st=1672677374~exp=1672677974~hmac=792260726039772412f447b7f9d73b6f04d0160fa9ae7f3fdbdb260b03dcc60621d6e2",
                rating: "$12-$30",
                speciality: "Capentry",
                description: Faker::Lorem.paragraph_by_chars(number: 260),
                admin_id: 1)

Handyman.create(username: "John Doe",
                password: "12345678",
                email: "johndoe@gmail.com",
                password_confirmation: "12345678",
                location: "Langata, Nairobi West",
                image: "https://img.freepik.com/free-photo/carpenter-cutting-plank-by-circular-saw_329181-3731.jpg?w=740&t=st=1672677374~exp=1672677974~hmac=792260726039772412f447b7f9d73b6f04d0160fa9ae7f3fdbdb260b03dcc60621d6e2",
                rating: "$12-$30",
                speciality: "Capentry",
                description: Faker::Lorem.paragraph_by_chars(number: 260),
                admin_id: 1)

Handyman.create(username: "Albert Raynold",
                password: "12345678",
                email: "albert@gmail.com",
                password_confirmation: "12345678",
                location: "Karen, Nairobi West",
                image: "https://img.freepik.com/free-photo/carpenter-cutting-plank-by-circular-saw_329181-3731.jpg?w=740&t=st=1672677374~exp=1672677974~hmac=792260726039772412f447b7f9d73b6f04d0160fa9ae7f3fdbdb260b03dcc60621d6e2",
                rating: "$12-$30",
                speciality: "Capentry",
                description: Faker::Lorem.paragraph_by_chars(number: 260),
                admin_id: 1)

Handyman.create(username: "Ian Kimondo",
                password: "12345678",
                email: "ian@gmail.com",
                password_confirmation: "12345678",
                location: "Ruiru,Kiambu",
                image: "https://img.freepik.com/free-photo/carpenter-cutting-plank-by-circular-saw_329181-3731.jpg?w=740&t=st=1672677374~exp=1672677974~hmac=792260726039772412f447b7f9d73b6f04d0160fa9ae7f3fdbdb260b03dcc60621d6e2",
                rating: "$12-$30",
                speciality: "Capentry",
                description: Faker::Lorem.paragraph_by_chars(number: 260),
                admin_id: 1)

puts "Review seeding"
Review.create(comment: Faker::Lorem.paragraph_by_chars(number: 260), customer_id: Customer.first.id, handyman_id: Handyman.first.id, votes: 0)
Review.create(comment: Faker::Lorem.paragraph_by_chars(number: 260), customer_id: Customer.second.id, handyman_id: Handyman.first.id, votes: 0)
Review.create(comment: Faker::Lorem.paragraph_by_chars(number: 260), customer_id: Customer.third.id, handyman_id: Handyman.first.id, votes: 0)
Review.create(comment: Faker::Lorem.paragraph_by_chars(number: 260), customer_id: Customer.fourth.id, handyman_id: Handyman.first.id, votes: 0)
Review.create(comment: Faker::Lorem.paragraph_by_chars(number: 260), customer_id: Customer.fifth.id, handyman_id: Handyman.first.id, votes: 0)

Review.create(comment: Faker::Lorem.paragraph_by_chars(number: 260), customer_id: Customer.first.id, handyman_id: Handyman.second.id, votes: 0)
Review.create(comment: Faker::Lorem.paragraph_by_chars(number: 260), customer_id: Customer.second.id, handyman_id: Handyman.second.id, votes: 0)
Review.create(comment: Faker::Lorem.paragraph_by_chars(number: 260), customer_id: Customer.third.id, handyman_id: Handyman.second.id, votes: 0)
Review.create(comment: Faker::Lorem.paragraph_by_chars(number: 260), customer_id: Customer.fourth.id, handyman_id: Handyman.second.id, votes: 0)
Review.create(comment: Faker::Lorem.paragraph_by_chars(number: 260), customer_id: Customer.fifth.id, handyman_id: Handyman.second.id, votes: 0)

Review.create(comment: Faker::Lorem.paragraph_by_chars(number: 260), customer_id: Customer.first.id, handyman_id: Handyman.third.id, votes: 0)
Review.create(comment: Faker::Lorem.paragraph_by_chars(number: 260), customer_id: Customer.second.id, handyman_id: Handyman.third.id, votes: 0)
Review.create(comment: Faker::Lorem.paragraph_by_chars(number: 260), customer_id: Customer.third.id, handyman_id: Handyman.third.id, votes: 0)
Review.create(comment: Faker::Lorem.paragraph_by_chars(number: 260), customer_id: Customer.fourth.id, handyman_id: Handyman.third.id, votes: 0)
Review.create(comment: Faker::Lorem.paragraph_by_chars(number: 260), customer_id: Customer.fifth.id, handyman_id: Handyman.third.id, votes: 0)

Review.create(comment: Faker::Lorem.paragraph_by_chars(number: 260), customer_id: Customer.first.id, handyman_id: Handyman.fourth.id, votes: 0)
Review.create(comment: Faker::Lorem.paragraph_by_chars(number: 260), customer_id: Customer.second.id, handyman_id: Handyman.fourth.id, votes: 0)
Review.create(comment: Faker::Lorem.paragraph_by_chars(number: 260), customer_id: Customer.third.id, handyman_id: Handyman.fourth.id, votes: 0)
Review.create(comment: Faker::Lorem.paragraph_by_chars(number: 260), customer_id: Customer.fourth.id, handyman_id: Handyman.fourth.id, votes: 0)
Review.create(comment: Faker::Lorem.paragraph_by_chars(number: 260), customer_id: Customer.fifth.id, handyman_id: Handyman.fourth.id, votes: 0)

puts "End of Review seeding"

puts "Message seeding"
10.times do
  Message.create(customer_id: rand(1..5), message: Faker::Lorem.paragraph_by_chars(number: 3, supplemental: true), handyman_id: rand(1..4))
end

puts "End of Message seeding"
