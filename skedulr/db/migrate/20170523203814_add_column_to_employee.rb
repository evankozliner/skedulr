class AddColumnToEmployee < ActiveRecord::Migration[5.0]
  def change
    add_column :employees, :manager_id, :integer
  end
end
