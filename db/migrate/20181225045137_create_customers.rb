class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.string :name, null:false	#氏名・商号
      t.string :kana	            #フリガナ
      t.string :type	            #個人・法人
      t.date :birthday	          #生年月日
      t.date :establishment	      #設立年月日
      t.string :company_number	  #会社法人等番号
      t.date :fiscal_year	        #決算期	            
      t.date :next_application	  #次回申請期日

      t.timestamps
      t.index :type
    end
  end
end
