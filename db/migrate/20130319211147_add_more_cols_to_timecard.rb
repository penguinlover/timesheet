class AddMoreColsToTimecard < ActiveRecord::Migration
  def change
    add_column :timecards, :start_date, :datetime
    add_column :timecards, :end_date, :datetime
  end
end
