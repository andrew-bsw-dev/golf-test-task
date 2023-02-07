class CreateTeeOffs < ActiveRecord::Migration[7.0]
  def change
    create_table :tee_offs do |t|
      t.datetime :start_at
      t.datetime :end_at
      t.date     :start_date
      t.integer  :interval
      t.integer  :interval_flag, default: 0

      t.timestamps
    end
  end
end
