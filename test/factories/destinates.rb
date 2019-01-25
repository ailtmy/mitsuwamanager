FactoryBot.define do
  factory :destinate do
    project { nil }
    send_date { "2019-01-24" }
    send_addr { "MyString" }
    send_number { "MyString" }
    receive_doc { false }
  end
end
