class Manager < ApplicationRecord
  belongs_to :business
  has_many :manager_employees
  has_many :employees, through: :manager_employees

  def find_employee_profile
    Employee.find(self.employee_id)
  end

  def find_name
    employee = self.find_employee_profile
    "#{employee.first_name} #{employee.last_name}"
  end

end
