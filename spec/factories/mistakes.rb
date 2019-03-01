FactoryBot.define do
  factory :mistake do
    user { nil }
    category { "MyString" }
    project_id { 1 }
    title { "MyString" }
    content { "MyText" }
    date { "2019-03-01" }
  end
end
