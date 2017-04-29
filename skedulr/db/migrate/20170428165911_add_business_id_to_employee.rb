class AddBusinessIdToEmployee < ActiveRecord::Migration[5.0]
  def change
    add_column :employees, :business_id, :integer
  end
end
