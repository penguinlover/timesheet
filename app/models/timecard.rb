class Timecard < ActiveRecord::Base
  attr_accessible :total_days, :total_hours, :start_date, :end_date
end
