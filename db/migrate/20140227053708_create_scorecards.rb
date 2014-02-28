class CreateScorecards < ActiveRecord::Migration
  def change
    create_table :scorecards do |t|
      t.integer :site_id
      t.string :org_name
      t.string :vertical
      t.integer :total_records
      t.integer :wrong_address_count
      t.integer :invalid_address_count
      t.integer :deceased_count
      t.integer :do_not_mail_count
      t.integer :missing_birthday_count
      t.integer :missing_email_count
      t.integer :missing_phone_number_count
      t.integer :missing_gender_count

      t.timestamps
    end

    add_index :scorecards, :site_id, :unique => true
  end
end
