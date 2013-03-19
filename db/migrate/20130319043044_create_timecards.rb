class CreateTimecards < ActiveRecord::Migration
  def change
    create_table :timecards do |t|
      t.integer :total_hours
      t.integer :total_days

      t.timestamps
    end
  end
end
