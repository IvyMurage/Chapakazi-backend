require "rails_helper"

RSpec.describe Review, type: :model do
  describe "Attributes" do
    it "review has valid attributes" do
      handyman = Handyman.create(username: "John Wilson",
                                 password: "123",
                                 email: "john@gmail.com",
                                 password_confirmation: "123",
                                 location: "Umoja, Nairobi",
                                 image: "https://img.freepik.com/free-photo/carpenter-cutting-plank-by-circular-saw_329181-3731.jpg?w=740&t=st=1672677374~exp=1672677974~hmac=79257539772412f447b7f9d73b6f04d0160fa9ae7f3fdbdb5b03dcc60621d6e2",
                                 rating: "$12-$30",
                                 speciality: "Capentry",
                                 description: Faker::Lorem.characters(number: 100),
                                 admin_id: 1)
      customer = Customer.create(username: "customer", password_confirmation: "123", password: "123", image: "https://via.placeholder.com/150", location: "Nairobi, Kenya", admin_id: 1)
      review = Review.create(comment: "I loved his work", customer_id: customer.id, handyman_id: handyman.id)
      expect(review).to be_valid
    end
  end

  describe "validates comment is present" do
    it { is_expected.to validate_presence_of(:comment) }
  end
  
end
