20.times do |n|
  Person.create(
    name: "個人顧客",
    kana: "コジンコキャク",
    birthday: n.months.ago.to_s
  )

  Company.create(
    name: "法人顧客",
    kana: "ホウジンコキャク",
    establishment: n.years.ago.to_s,
    company_number: (120_001_000_001 + n).to_s,
    fiscal_year: 3,
    next_application: (Date.today >> n).to_s
  )
end

User.create(
  name: "高瀬",
  email: 'takase@mitsuwa-odd.jp',
  password: 'password',
  admin: true
)
