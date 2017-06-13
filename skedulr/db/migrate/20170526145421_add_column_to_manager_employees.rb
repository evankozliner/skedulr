class AddColumnToManagerEmployees < ActiveRecord::Migration[5.0]
  def change
    add_column :manager_employees, :manager_id, :integer
    add_column :manager_employees, :employee_id, :integer
    add_column :manager_employees, :business_id, :integer
  end
end
