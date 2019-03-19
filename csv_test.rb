require 'csv'
ha = Hash.new{|hash, key | hash[key] = []}
CSV.foreach('./casefile.csv', headers: true) do |row|
  ha['customer_id'] << row['customer_id']
  ha['customer_id'] << row['customer_id2']
  ha['applicant'] << row['applicant']
  ha['applicant'] << row['applicant2']
end
ha.each do |h|
  puts h
end