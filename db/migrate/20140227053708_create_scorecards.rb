class CreateScorecards < ActiveRecord::Migration
  def change
    create_table :scorecards do |t|
      t.integer :site_id
      t.string :org_name
      t.string :data

      t.timestamps
    end

    add_index :scorecards, :site_id, :unique => true
  end
end
