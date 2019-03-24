Fabricator(:user) do
  email { Faker::Internet.email }
  first_name { Faker::Name.first_name.sub("'", '') }
  last_name { Faker::Name.last_name.sub("'", '') }
end
