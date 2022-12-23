FactoryBot.define do
  factory :handyman do
    username { "MyString" }
    password_digest { "MyString" }
    location { "MyString" }
    image { "MyString" }
    description { "MyString" }
    admin_id { 1 }
    rating { "MyString" }
  end
end
