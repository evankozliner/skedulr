class EmployeesController < ApplicationController
  include EmployeesHelper

  def index
    @employee = current_employee
    @businesses = @employee.businesses
  end

  def create
    @employee = current_employee
    @employee.update(employee_params)
  end

  def edit
    @employee = current_employee
  end

  def update
    @employee = current_employee
    @employee.update(employee_params)

    redirect_to shifts_path
  end
end
