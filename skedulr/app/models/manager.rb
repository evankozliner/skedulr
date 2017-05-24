class Manager < ApplicationRecord
  belongs_to :business
  has_many :manager_employees
  has_many :employees, through: :manager_employees

  def find_employee
    Employee.find(self.employee_id)
  end

end
