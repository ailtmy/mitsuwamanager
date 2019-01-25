FactoryBot.define do
  factory :price do
    year { 1 }
    price { 1 }
    estate { nil }
    price_kind { "MyString" }
    remarks { "MyText" }
  end
end
