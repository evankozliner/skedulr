class AddColumnToManagers < ActiveRecord::Migration[5.0]
  def change
    add_column :managers, :business_id, :integer
    add_column :managers, :employee_id, :integer 
  end
end
