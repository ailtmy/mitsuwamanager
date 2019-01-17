class AddColumnCustomerAgents < ActiveRecord::Migration[5.2]
  def up
    add_column :customer_agents, :title, :string
  end

  def down
    remove_column :customer_agents, :title, :string
  end
end
