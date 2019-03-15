require 'csv'

CSV.foreach('./casefile.csv', headers: true) do |row|
  cys = row.to_hash.slice('customer_id', 'applicant', 'customer_id2', 'applicant2')
  ar = cys.flatten.to
  p ar1 = ar.slice(0..3)
  p ar2 = ar.slice(4..7)

  
end