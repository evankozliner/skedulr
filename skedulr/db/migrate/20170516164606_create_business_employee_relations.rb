class CreateBusinessEmployeeRelations < ActiveRecord::Migration[5.0]
  def change
    create_table :business_employee_relations do |t|
      

      t.timestamps
    end
  end
end
