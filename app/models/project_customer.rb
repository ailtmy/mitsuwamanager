class ProjectCustomer < ApplicationRecord
  belongs_to :customer
  belongs_to :project

  def selectable_customers
    Customer.all
  end

  def self.position_select
    %w(買主 売主 融資先 融資先担当者 抹消先 抹消先担当者 リハウス 他仲介 司法書士)
  end

  def self.new_position_select
    %w(事業主 事業主担当者 販売代理 販売担当者 融資先 融資先担当者 土地家屋調査士 司法書士)
  end

  def self.gene_position_select
    %w(買主 売主 融資先 融資先担当者 抹消先 抹消先担当者 嘱託人 他仲介 司法書士)
  end

  def self.lf_position_select
    %w(ＬＦ担当者 債務者 設定者 抹消先 抹消先担当者 司法書士 土地家屋調査士 関係者)
  end

  def self.inherit_position_select
    %w(被相続人 相続人代表 相続人 嘱託人 関係者)
  end

  def self.customer_select(project, position)
    customers = []
    project.project_customers.map do |customer|
      if customer.position == position
        customers << { id: customer.customer_id.to_s, equity: customer.equity.to_s, 
          name: customer.customer.name.to_s,  path: customer.customer.to_s, position: customer.position}
      end
    end
    customers
  end

  def self.not_customer_select(project, position, position2)
    customers = []
    project.project_customers.map do |customer|
      if customer.position != position && customer.position != position2
        customers << { id: customer.customer_id.to_s, equity: customer.equity.to_s, 
          name: customer.customer.name.to_s,  path: customer.customer.to_s, position: customer.position}
      end
    end
    customers
  end

  def self.branch_select(project, position)
    branchs = []
    branch_staffs = customer_select(project, position)
    branch_staffs.each do |branch_staff|
      branchs << BranchStaff.order('assigned_date desc').find_by(staff_id: branch_staff[:id])
    end
    branchs unless branchs.nil?
  end
end
