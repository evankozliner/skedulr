class RemoveColumnFromEmployee < ActiveRecord::Migration[5.0]
  def change
    remove_column :employees, :is_manager, :integer
    remove_column :employees, :manager_table_id, :integer
  end
end
