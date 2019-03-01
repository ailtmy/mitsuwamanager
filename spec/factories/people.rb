FactoryBot.define do
  factory :person, class: Person do
    name { '試験顧客' }
    kana { 'テストコキャク' }
    birthday { '2019-01-01' }

    trait :with_address do
      association :address, factory: :address
      address
    end

    trait :with_tel do
      association :tel, factory: :tel
      tel
    end

    trait :with_mail do
      association :mail, factory: :mail
      mail
    end
  end

  factory :address, class: Address do
    zip { '123456' }
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
