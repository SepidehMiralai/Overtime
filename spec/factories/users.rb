FactoryBot.define do
  # factory :user do
  #   email { "sepid@test.com" }
  #   password { "asdfasdf" }
  #   first_name {"sepid"}
  #   last_name {"mir"}
  # end

  factory :user do
    email { Faker::Internet.email }
    password { Faker::Internet.password }
    first_name {Faker::Name.name}
    last_name {Faker::Name.name}
  end

  # factory :admin_user, class: "User" do
  #   email { "admin@user.com" }
  #   password { Faker::Internet.password }
  #   first_name {"Admin"}
  #   last_name {"User"}
  # end

  factory :second_user do
    email { Faker::Internet.email }
    password { Faker::Internet.password }
    first_name {Faker::Name.name}
    last_name {Faker::Name.name}
  end

end