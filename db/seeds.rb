20.times do |n|
  Person.create(
    :name => "個人顧客",
    :kana => "コジンコキャク",
    :birthday => "#{n.months.ago}"
  )

  Company.create(
    :name => "法人顧客",
    :kana => "ホウジンコキャク",
    :establishment => "#{n.years.ago}",
    :company_number => "#{120001000001 + n}",
    :fiscal_year => 3,
    :next_application => "#{Date.today() >> n}"
  )
end