FactoryBot.define do
  factory :identify do
    user { nil }
    customer { nil }
    ident_method { "MyString" }
    date_time { "2019-01-17 14:14:48" }
    place { "MyString" }
    item { "MyString" }
    photo { "MyString" }
    number { "MyString" }
    issuance_date { "2019-01-17" }
    expiration_date { "2019-01-17" }
    publisher { "MyString" }
    ident_receipt { "2019-01-17" }
    original_copy { false }
    send_date { "2019-01-17" }
    document_receipt { "2019-01-17" }
    remarks { "MyText" }
  end
end
