class ManagerEmployee < ApplicationRecord
  has_many :employees
  belongs_to :business

  def find_employee_profile
    Employee.find(self.manager_id)
  end

  def full_name
    self.find_employee_profile.full_name
  end

end
