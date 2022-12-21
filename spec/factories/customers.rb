FactoryBot.define do
  factory :customer do
    username { "MyString" }
    image { "MyString" }
    password_digest { "MyString" }
    location { "MyString" }
    description { "MyString" }
    admin_id { 1 }
  end
end
