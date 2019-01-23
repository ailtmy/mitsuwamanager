FactoryBot.define do
  factory :gift do
    customer { nil }
    send_receive { "MyString" }
    gift_kind { "MyString" }
    gift_year { 1 }
    gift_address { "MyString" }
    gift_remark { "MyText" }
  end
end
