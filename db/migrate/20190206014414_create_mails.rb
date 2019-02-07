class CreateMails < ActiveRecord::Migration[5.2]
  def change
    create_table :mails do |t|
      t.references :mailable, polymorphic: true
      t.string :mail_address
      t.string :mail_kind

      t.timestamps
    end
  end
end
