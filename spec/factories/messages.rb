FactoryBot.define do
  factory :message do
    handyman_id { 1 }
    customer_id { 1 }
    message { "MyString" }
  end
end
