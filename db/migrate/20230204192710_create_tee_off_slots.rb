class CreateTeeOffSlots < ActiveRecord::Migration[7.0]
  def change
    create_table :tee_off_slots do |t|
      t.belongs_to  :tee_off
      t.belongs_to  :user

      t.timestamps
    end
  end
end
