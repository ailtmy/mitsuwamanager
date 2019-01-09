FactoryBot.define do
  factory :address do
    addressable { nil }
    zip { "MyString" }
    address { "MyString" }
    since_date { "2019-01-07" }
  end
end
