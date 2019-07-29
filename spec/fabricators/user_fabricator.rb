Fabricator(:user) do
  email { Faker::Internet.email }
  password { Faker::Internet.password.sub("'", '') }
  first_name { Faker::Name.first_name.sub("'", '') }
  last_name { Faker::Name.last_name.sub("'", '') }
end
