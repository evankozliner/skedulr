class EmployeeController < ApplicationController

  def create
    @employee = current_employee
    @employee.update(employee_params)
  end

  def new
  end

end
