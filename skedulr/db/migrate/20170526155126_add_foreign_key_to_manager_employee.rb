class AddForeignKeyToManagerEmployee < ActiveRecord::Migration[5.0]
  def change
    add_foreign_key :manager_employees, :employees, column: :manager_id, primary_key: :id
  end
end
