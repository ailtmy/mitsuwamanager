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

  def self.buyer_select(project)
    buyers = []
    project.project_customers.map do |customer|
      if customer.position == "買主"
        buyers << { equity: customer.equity.to_s, name: customer.customer.name.to_s, path: customer.customer.to_s }
      end
    end
    buyers
  end

  def self.debtor_select(project)
    debtors = []
    project.project_customers.map do |customer|
      if customer.position == "債務者"
        debtors << { name: customer.customer.name.to_s, path: customer.customer.to_s }
      end
    end
    debtors
  end

  def self.mortgagor_select(project)
    mortgagors = []
    project.project_customers.map do |customer|
      if customer.position == "設定者"
        mortgagors << { name: customer.customer.name.to_s, path: customer.customer.to_s }
      end
    end
    mortgagors
  end

  def self.loan_select(project)
    loans = []
    project.project_customers.map do |customer|
      if customer.position == "融資先"
        loans << { name: customer.customer.name.to_s, path: customer.customer.to_s }
      end
    end
    loans
  end

  def self.loan_staff_select(project)
    loan_staffs = []
    project.project_customers.map do |customer|
      if customer.position == "融資先担当者"
        loan_staffs << { name: customer.customer.name.to_s, path: customer.customer.to_s, id: customer.customer_id.to_s }
      end
    end
    loan_staffs
  end

  def self.loan_branch_select(project)
    branchs = []
    loan_staffs = loan_staff_select(project)
    loan_staffs.each do |loan_staff|
      branchs << BranchStaff.order('assigned_date desc').find_by(staff_id: loan_staff[:id])
    end
    branchs unless branchs.nil?
  end

  def self.seller_select(project)
    sellers = []
    project.project_customers.map do |customer|
      if customer.position == "売主"
        sellers << { name: customer.customer.name.to_s, path: customer.customer.to_s }
      end
    end
    sellers
  end

  def self.rehouse_select(project)
    rehousers = []
    project.project_customers.map do |customer|
      if customer.position == "リハウス"
        rehousers << { name: customer.customer.name.to_s, path: customer.customer.to_s, id: customer.customer_id.to_s }
      end
    end
    rehousers
  end

  def self.lf_select(project)
    lfers = []
    project.project_customers.map do |customer|
      if customer.position == "ＬＦ担当者"
        lfers << { name: customer.customer.name.to_s, path: customer.customer.to_s, id: customer.customer_id.to_s }
      end
    end
    lfers
  end

  def self.commissioner_select(project)
    commissioners = []
    project.project_customers.map do |customer|
      if customer.position == "嘱託人"
        commissioners << { name: customer.customer.name.to_s, path: customer.customer.to_s, id: customer.customer_id.to_s }
      end
    end
    commissioners
  end

  def self.commissioner_staff_select(project)
    branchs = []
    commissioners = commissioner_select(project)
    commissioners.each do |commissioner|
      branchs << BranchStaff.order('assigned_date desc').find_by(staff_id: commissioner[:id])
    end
    branchs unless branchs.nil?
  end

  def self.lf_branch_select(project)
    branchs = []
    lfers = lf_select(project)
    lfers.each do |lfer|
      branchs << BranchStaff.order('assigned_date desc').find_by(staff_id: lfer[:id])
    end
    branchs unless branchs.nil?
  end

  def self.rehouse_staff_select(project)
    branchs = []
    rehousers = rehouse_select(project)
    rehousers.each do |rehouser|
      branchs << BranchStaff.order('assigned_date desc').find_by(staff_id: rehouser[:id])
    end
    branchs unless branchs.nil?
  end

  def self.erase_select(project)
    eraser = []
    project.project_customers.map do |customer|
      if customer.position == "抹消先"
        eraser << { name: customer.customer.name.to_s, path: customer.customer.to_s }
      end
    end
    eraser
  end

  def self.eraser_staff_select(project)
    erasers = []
    project.project_customers.map do |customer|
      if customer.position == "抹消先担当者"
        erasers << { name: customer.customer.name.to_s, path: customer.customer.to_s, id: customer.customer_id.to_s }
      end
    end
    erasers
  end

  def self.eraser_branch_select(project)
    branchs = []
    eraser_staffs = loan_staff_select(project)
    eraser_staffs.each do |eraser_staff|
      branchs << BranchStaff.order('assigned_date desc').find_by(staff_id: eraser_staff[:id])
    end
    branchs unless branchs.nil?
  end

  def self.scrivener_select(project)
    scriveners = []
    project.project_customers.map do |customer|
      if customer.position == "司法書士"
        scriveners << { name: customer.customer.name.to_s, path: customer.customer.to_s, id: customer.customer_id.to_s }
      end
    end
    scriveners
  end

  def self.surveyor_select(project)
    surveyors = []
    project.project_customers.map do |customer|
      if customer.position == "土地家屋調査士"
        surveyors << { name: customer.customer.name.to_s, path: customer.customer.to_s, id: customer.customer_id.to_s }
      end
    end
    surveyors
  end

  def self.mediator_select(project)
    mediators = []
    project.project_customers.map do |customer|
      if customer.position == "関係者"
        mediators << { name: customer.customer.name.to_s, path: customer.customer.to_s, id: customer.customer_id.to_s }
      end
    end
    mediators
  end

  def self.intermediator_select(project)
    intermediators = []
    project.project_customers.map do |customer|
      if customer.position == "他仲介"
        intermediators << { name: customer.customer.name.to_s, path: customer.customer.to_s, id: customer.customer_id.to_s }
      end
    end
    intermediators
  end

  def self.decedent_select(project)
    decedents = []
    project.project_customers.map do |customer|
      if customer.position == "被相続人"
        decedents << { name: customer.customer.name.to_s, path: customer.customer.to_s, id: customer.customer_id.to_s }
      end
    end
    decedents
  end

  def self.representative_select(project)
    representatives = []
    project.project_customers.map do |customer|
      if customer.position == "相続人代表"
        representatives << { name: customer.customer.name.to_s, path: customer.customer.to_s, id: customer.customer_id.to_s }
      end
    end
    representatives
  end

  def self.heir_select(project)
    heirs = []
    project.project_customers.map do |customer|
      if customer.position == "相続人"
        heirs << { name: customer.customer.name.to_s, path: customer.customer.to_s, id: customer.customer_id.to_s }
      end
    end
    heirs
  end

  def self.other_select(project)
    others = []
    project.project_customers.map do |customer|
      if customer.position != "嘱託人"
        others << { position: customer.position.to_s, name: customer.customer.name.to_s, path: customer.customer.to_s, id: customer.customer_id.to_s }
      end
    end
    others
  end

  def self.developer_select(project)
    developers = []
    project.project_customers.map do |customer|
      developers << customer if customer.position == "事業主"
    end
    developers
  end

  def self.developer_staff_select(project)
    developer_staffs = []
    project.project_customers.map do |customer|
      developer_staffs << customer if customer.position == "事業主担当者"
    end
    developer_staffs
  end

  def self.developer_branch_select(project)
    branchs = []
    branchstaffs = developer_staff_select(project)
    branchstaffs.each do |branchstaff|
      branchs << BranchStaff.order('assigned_date desc').find_by(staff_id: branchstaff[:customer_id])
    end
    branchs unless branchs.nil?
  end

  def self.distributer_select(project)
    distributers = []
    project.project_customers.map do |customer|
      distributers << customer if customer.position == "販売代理"
    end
    distributers
  end

  def self.distributer_staff_select(project)
    distributer_staffs = []
    project.project_customers.map do |customer|
      distributer_staffs << customer if customer.position == "販売担当者"
    end
    distributer_staffs
  end

  def self.distributer_branch_select(project)
    branchs = []
    branchstaffs = distributer_staff_select(project)
    branchstaffs.each do |branchstaff|
      branchs << BranchStaff.order('assigned_date desc').find_by(staff_id: branchstaff[:customer_id])
    end
    branchs unless branchs.nil?
  end
end
