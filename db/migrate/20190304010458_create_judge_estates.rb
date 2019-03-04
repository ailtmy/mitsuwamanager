class CreateJudgeEstates < ActiveRecord::Migration[5.2]
  def change
    create_table :judge_estates do |t|
      t.references :judge, foreign_key: true
      t.references :estate, foreign_key: true

      t.timestamps
    end
  end
end
