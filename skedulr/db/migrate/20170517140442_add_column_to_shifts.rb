class AddColumnToShifts < ActiveRecord::Migration[5.0]
  def change
    add_column :shifts, :business_id, :integer
  end
end
