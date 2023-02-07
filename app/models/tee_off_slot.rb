class TeeOffSlot < ApplicationRecord
  belongs_to :user
  belongs_to :tee_off

  enum :status, { confirmed: 0, started: 1, ended: 2, cancelled: 3 }
end
