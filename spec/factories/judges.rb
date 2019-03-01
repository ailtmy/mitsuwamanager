FactoryBot.define do
  factory :judge do
    title { "MyString" }
    category { "MyString" }
    control { nil }
    datetime { "2019-03-01 19:43:53" }
    user { nil }
    estate_id { 1 }
    content { "MyText" }
    document { "MyText" }
    opinion { "MyText" }
    answer { "MyText" }
    answer_control { "MyString" }
    answer_number { "MyString" }
    event { "MyString" }
    cause_date { "MyString" }
    status { "MyString" }
  end
end
