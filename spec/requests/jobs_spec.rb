require "rails_helper"
RSpec.describe "Jobs", type: :request do
  describe "GET /jobs" do
    before do
      customer = Customer.create(username: "customer", password_confirmation: "123", password: "123", image: "https://via.placeholder.com/150", location: "Nairobi, Kenya", admin_id: 1)
      Job.create!(title: "Plumbering", description: "As you can see, the example failed because our validation functionality needs to be added to the model", budget: "$10-$20", customer_id: customer.id)
      Job.create!(title: "Capentry", description: "As you can see, the example failed because our validation functionality needs to be added to the model", budget: "$5-$10", customer_id: customer.id)
    end
    it "Should return an array of jobs" do
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
      jwt = confirm_and_login_handyman(handyman)
      get "/jobs", headers: { "Authorization" => "Bearer #{jwt}" }
      expect(response.body).to include_json([
                                 { title: "Plumbering", summary: "As you can see, the example failed because our validation functionality needs to be added to the model"[0..50] += "...", budget: "$10-$20" },
                                 { title: "Capentry", summary: "As you can see, the example failed because our validation functionality needs to be added to the model"[0..50] += "...", budget: "$5-$10" },
                               ])

      expect(JSON.parse(response.body)).to be_kind_of(Array)
      # expect(response).to have_http_status(:unauthorized)
    end
    # it "Should return a status code of ok" do
    #   expect(response).to have_http_status(:ok)
    # end
  end

  describe "SHOW /jobs/:id" do
    before do
      customer = Customer.create(username: "customer", password_confirmation: "123", password: "123", image: "https://via.placeholder.com/150", location: "Nairobi, Kenya", admin_id: 1)
      Job.create!(
        title: "IT",
        description: "As you can see, the example failed because our validation functionality needs to be added to the model",
        budget: "$46-$96",
        customer_id: customer.id,
      )
    end
    it "returns the first job" do
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
      jwt = confirm_and_login_handyman(handyman)

      get "/jobs/#{Job.first.id}", headers: { "Authorization" => "Bearer #{jwt}" }

      expect(response.body).to include_json({
        id: a_kind_of(Integer),
        title: "IT",
        budget: "$46-$96",
        description: "As you can see, the example failed because our validation functionality needs to be added to the model",
        customer: a_kind_of(Object),
      })
    end
  end

  describe "DELETE jobs/:id" do
    before do
      customer = Customer.create(username: "customer", password_confirmation: "123", password: "123", image: "https://via.placeholder.com/150", location: "Nairobi, Kenya", admin_id: 1)
      Job.create!(
        title: "IT",
        description: "As you can see, the example failed because our validation functionality needs to be added to the model",
        budget: "$46-$96",
        customer_id: customer.id,
      )
    end

    it "returns no content after deletion" do
      customer = Customer.create(username: "customer", password_confirmation: "123", password: "123", image: "https://via.placeholder.com/150", location: "Nairobi, Kenya", admin_id: 1)
      jwt = confirm_and_login_customer(customer)
      delete "/jobs/#{Job.first.id}", headers: { "Authorization" => "Bearer #{jwt}" }
      expect(Job.all).to eq []
    end
  end

  describe "CREATE /jobs" do
    customer = Customer.create(username: "customer", password_confirmation: "123", password: "123", image: "https://via.placeholder.com/150", location: "Nairobi, Kenya", admin_id: 1)

    it "it expects to create a new job" do
      customer = Customer.create(username: "customer", password_confirmation: "123", password: "123", image: "https://via.placeholder.com/150", location: "Nairobi, Kenya", admin_id: 1)
      jwt = confirm_and_login_customer(customer)

      expect {
        post "/jobs", headers: { "Authorization" => "Bearer #{jwt}" }, params: {
                        title: "Capentry",
                        description: "As you can see, the example failed because our validation functionality needs to be added to the model",
                        budget: "$20-$50",
                        customer_id: customer.id,

                      }
      }.to change(Job, :count).by(1)
    end

    it "returns the job data" do
      customer = Customer.create(username: "customer",
                                 password_confirmation: "123",
                                 password: "123",
                                 image: "https://via.placeholder.com/150",
                                 location: "Nairobi, Kenya",
                                 admin_id: 1)

      jwt = confirm_and_login_customer(customer)
      post "/jobs", headers: { "Authorization" => "Bearer #{jwt}", "ContentType": "application/json" }, params: {
                      title: "Capentry",
                      description: "As you can see, the example failed because our validation functionality needs to be added to the model",
                      budget: "$20-$50",
                      customer_id: customer.id,

                    }
      expect(response).to have_http_status(:created)
      expect(response.body).to include_json({
        id: a_kind_of(Integer),
        title: "Capentry",
        summary: "As you can see, the example failed because our validation functionality needs to be added to the model"[0..50] += "...",
        budget: "$20-$50",
      })
    end
  end
end
