FactoryBot.define do
  factory :customer do
    name { "MyString" }
    kana { "MyString" }
    type { "" }
    birthday { "2018-12-25" }
    establishment { "2018-12-25" }
    company_number { "MyString" }
    fiscal_year { "MyString" }
    date { "MyString" }
    next_application { "2018-12-25" }
  end
end
