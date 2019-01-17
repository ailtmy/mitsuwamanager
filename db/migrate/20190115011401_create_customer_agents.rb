class CreateCustomerAgents < ActiveRecord::Migration[5.2]
  def change
    create_table :customer_agents do |t|
      t.references :customer
      t.references :agent

      t.timestamps
    end
  end
end
