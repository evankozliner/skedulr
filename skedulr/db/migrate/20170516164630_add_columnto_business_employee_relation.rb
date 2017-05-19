class AddColumntoBusinessEmployeeRelation < ActiveRecord::Migration[5.0]
  def change
    add_column :business_employee_relations, :business_id, :integer
    add_column :business_employee_relations, :employee_id, :integer
  end
end
