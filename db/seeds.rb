# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Timecard.delete_all
Project.delete_all
User.delete_all

# users
users = 5.times.inject([]) do |data, c|
  seq = c.to_s;
  first_name = 'fn_' + seq
  last_name = 'ln_' + seq
  data << { email: "#{first_name}_#{last_name}@comitydesigns.com",
            firstname: first_name, lastname: last_name, phone: "678622#{seq*4}" }
end

# projects
projects = 5.times.inject([]) do |data, c|
  data << { name: 'project-' + c.to_s, description: 'description-' + c.to_s }
end

# timecards
timecards = 5.times.inject([]) do |data, c|
  rd = rand 3
  data << { start_date: 6.week.ago, end_date: Time.now,
            total_hours: [24, 36, 40][rd], total_days: [3, 4, 5][rd] }
end

User.create(users)
Project.create(projects)
Timecard.create(timecards)