FactoryBot.define do
  factory :person, class: Person do
    name { '試験顧客' }
    kana { 'テストコキャク' }
    birthday { '2019-01-01' }
    after(:build) do |person|
      person.addresses << FactoryBot.build(:address)
      person.save!
    end
  end

  factory :address, class: Address do
    zip { '1234567' }
    address { 'テスト住所' }
    since_date { '2019-02-01' }
    address_kind { '住所' }
  end

  factory :tel, class: Tel do
    tel_kind { 'テスト電話' }
    tel_number { '1234567890' }
  end

  factory :mail, class: Mail do
    mail_kind { 'テストメール' }
    mail_address { 'abc@def.jp' }
  end
end
