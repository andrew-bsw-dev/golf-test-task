class AddStatusToTeeOffSlots < ActiveRecord::Migration[7.0]
  def change
    add_column :tee_off_slots, :status, :integer
  end
end
