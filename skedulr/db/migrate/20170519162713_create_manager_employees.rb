class CreateManagerEmployees < ActiveRecord::Migration[5.0]
  def change
    create_table :manager_employees do |t|

      t.timestamps
    end
  end
end
