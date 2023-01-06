require "rails_helper"

RSpec.describe Job, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  it "is valid with valid attributes" do
    customer = Customer.create!(username: "customer", password_confirmation: "123", password: "123", image: "https://via.placeholder.com/150", location: "Nairobi Kenya", admin_id: 1)
    job = Job.create!(title: "hello", description: "As you can see, the example failed because our validation functionality needs to be added to the mod", budget: "$20-$30", customer_id: customer.id)
    expect(job).to be_valid
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_length_of(:description).is_at_least(100) }
  end

  it "belongs to one customer" do
    expect(Job.new).to respond_to(:customer)
  end
end
