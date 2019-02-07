FactoryBot.define do
  factory :mail do
    mailable { nil }
    mail_address { "MyString" }
    mail_kind { "MyString" }
  end
end
