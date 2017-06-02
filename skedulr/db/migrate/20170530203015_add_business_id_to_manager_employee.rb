class AddBusinessIdToManagerEmployee < ActiveRecord::Migration[5.0]
  def change
    add_column :manager_employees, :business_id, :integer
  end
end
