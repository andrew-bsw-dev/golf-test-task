class TeeOff < ApplicationRecord
  include Timeable

  has_many :tee_off_slots
  has_many :users, through: :tee_off_slots

  enum :interval_flag, { available: 0, booked: 1 }

  default_scope { order(start_date: :asc, start_at: :asc) }
end
