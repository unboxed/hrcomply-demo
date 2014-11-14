FactoryGirl.define do
  factory :employee do
    name { Faker::Name.name }
    title { Faker::Name.title }
    notes { Faker::Lorem.paragraph(5) }
  end
end
