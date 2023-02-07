# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'securerandom'
interval = 30 # in minutes
time_slots = 17 # from 8:00 am to 4:00 pm with interval of 30 minutes

30.times do |index|
  date = Date.today.since(index.days)
  start_time = date.beginning_of_day.since(8.hours)
  end_time = start_time.since(interval.minutes)

  time_slots.times do |_slot_index|
    TeeOff.create(start_date: date, start_at: start_time, end_at: end_time, interval:)
    start_time = start_time.since(interval.minutes)
    end_time = start_time.since(interval.minutes)
  end
end

password = SecureRandom.hex(8)
user = User.new(
  email: 'me@example.com',
  password:,
  password_confirmation: password
)
user.save!
user.add_role('golfer')

# 8:00 to 8.30
# 8:30 to 9.00
# 9:00 to 9.30
# 9:30 to 10.00
# 10:00 to 10.30
# 10:30 to 11.00
# 11:00 to 11.30
# 11:30 to 12.00
# 12:00 to 12.30
# 12:30 to 1.00
# 1:00 to 1.30
# 1:30 to 2.00
# 2:00 to 2.30
# 2:30 to 3.00
# 3:00 to 3.30
# 3:30 to 4.00
# 4:00 to 4.30
# 4:30 to 5.00
# [8:00, 8:30, 9:00, 9:30, 10:00, 10:30, 11:00, 11:30, 12:00, 12:30, 1:00, 1:30, 2:00, 2:30, 3:00, 3:30, 4:00]
