class AddManagerIdIndexToManagerEmployee < ActiveRecord::Migration[5.0]
  def change
    add_index :manager_employees, :manager_id
  end
end
