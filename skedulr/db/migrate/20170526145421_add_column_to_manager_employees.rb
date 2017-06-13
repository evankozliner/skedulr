class AddColumnToManagerEmployees < ActiveRecord::Migration[5.0]
  def change
    create_table :manager_employees do |t|
      t.integer :manager_id
      t.integer :employee_id
      t.integer :business_id
    end
  end
end
