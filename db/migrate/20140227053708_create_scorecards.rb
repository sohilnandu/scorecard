class CreateScorecards < ActiveRecord::Migration
  def change
    create_table :scorecards do |t|
      t.integer :site_id
      t.string :org_name
      t.string :vertical
      t.integer :total_records
      t.integer :wrong_address_count
      t.float :wrong_address_percent
      t.integer :invalid_address_count
      t.float :invalid_address_percent
      t.integer :deceased_count
      t.float :deceased_percent
      t.integer :missing_birthday_count
      t.float :missing_birthday_percent
      t.integer :missing_email_count
      t.float :missing_email_percent
      t.integer :missing_phone_number_count
      t.float :missing_phone_number_percent
      t.integer :missing_gender_count
      t.float :missing_gender_percent

      t.timestamps
    end

    add_index :scorecards, :site_id, :unique => true
  end
end
