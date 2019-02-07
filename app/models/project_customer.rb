class ProjectCustomer < ApplicationRecord

  belongs_to :customer
  belongs_to :project
  belongs_to :project, :class_name => 'Rehouse', inverse_of: :project_customers

  def selectable_customers
    Customer.all
  end

  def self.position_select
    %w[買主 売主 融資先 抹消先 リハウス 他仲介 司法書士 土地家屋調査士]
  end

  def self.buyer_select(customer)
    if customer.position == "買主"
      return "持分：#{customer.equity}　#{customer.customer.name}"
    end
  end

  def self.seller_select(customer)
    if customer.position == '売主'
      customer.customer.name
    end 
  end

  def self.rehouse_select(customer)
    if customer.position == 'リハウス'
      customer.customer.name
    end 
  end

  def self.erase_select(customer)
    if customer.position == '抹消先'
      return "#{customer.customer.name}"
      
    end 
  end
end
