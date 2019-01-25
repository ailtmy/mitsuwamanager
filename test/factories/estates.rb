FactoryBot.define do
  factory :estate do
    estate_number { 1 }
    address { "MyString" }
    number { "MyString" }
    estate_kind { "MyString" }
    area { "MyText" }
    structure { "MyString" }
    apart_name { "MyString" }
    apart_structure { "MyString" }
    apart_area { "MyText" }
    sign { 1 }
    land_kind { "MyString" }
    land_percent { "MyString" }
    remarks { "MyText" }
  end
end
