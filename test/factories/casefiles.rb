FactoryBot.define do
  factory :casefile do
    year { 1 }
    number { 1 }
    date { "2019-01-10" }
    event_title { "MyString" }
    event_number { 1 }
    count { 1 }
    project { nil }
  end
end
