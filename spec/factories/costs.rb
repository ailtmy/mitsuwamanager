FactoryBot.define do
  factory :cost do
    project { nil }
    date { "2019-03-01" }
    category { "MyString" }
    pay_org { "MyString" }
    pay { "MyString" }
  end
end
