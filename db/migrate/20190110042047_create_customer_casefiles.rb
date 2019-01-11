class CreateCustomerCasefiles < ActiveRecord::Migration[5.2]
  def change
    create_table :customer_casefiles do |t|
      t.references :customer, foreign_key: true
      t.references :casefile, foreign_key: true
      t.string :applicant

      t.timestamps
    end
  end
end
