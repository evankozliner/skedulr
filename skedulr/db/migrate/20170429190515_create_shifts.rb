class CreateShifts < ActiveRecord::Migration[5.0]
  def change
    create_table :shifts do |t|
      t.datetime :start
      t.datetime :stop
      t.integer :employee_id

      t.timestamps
    end
  end
end
