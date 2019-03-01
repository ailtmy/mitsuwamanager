FactoryBot.define do
  factory :mitsuwa_doc do
    title { "MyString" }
    category { "MyString" }
    kind { "MyString" }
    content { "MyText" }
    user { nil }
    date { "2019-03-01" }
  end
end
