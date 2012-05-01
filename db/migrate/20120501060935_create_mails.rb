class CreateMails < ActiveRecord::Migration
  def change
    create_table :mails do |t|
      t.string :from
      t.string :from_name
      t.string :to
      t.string :subject
      t.text :message

      t.timestamps
    end
  end
end
