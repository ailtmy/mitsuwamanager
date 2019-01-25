FactoryBot.define do
  factory :certificate do
    cert_kind { "MyString" }
    number_sheet { 1 }
    project { nil }
  end
end
