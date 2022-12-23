require "rails_helper"

RSpec.describe "Jobs", type: :request do
  before do
    customer = Customer.create(username: "customer", password_confirmation: "sup3r-secret", password: "sup3r-secret", image: "https://via.placeholder.com/150", description: "As you can see, the example failed because our validation functionality needs to be added to the model")
    Job.create!(title: "Plumbering", description: "As you can see, the example failed because our validation functionality needs to be added to the model", budget: "$10-$20", customer_id: customer.id)
    Job.create!(title: "Capentry", description: "As you can see, the example failed because our validation functionality needs to be added to the model", budget: "$5-$10", customer_id: customer.id)
  end
  describe "GET /jobs" do
    it "Should return an array of jobs" do
      get "/jobs"

      expect(response.body).to include_json([
                                 { title: "Plumbering", summary: "As you can see, the example failed because our validation functionality needs to be added to the model"[1..50] += "...", budget: "$10-$20" },
                                 { title: "Capentry", summary: "As you can see, the example failed because our validation functionality needs to be added to the model"[1..50] += "...", budget: "$5-$10" },
                               ])
    end
    it "Should return a status code of ok" do
      expect(response).to have_http_status(:ok)
    end
  end
end
