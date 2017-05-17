class EmployeesController < ApplicationController
  include EmployeesHelper

  def create
    @employee = current_employee
    @employee.update(employee_params)
  end

  def edit
    @employee = current_employee
  end

  def show
    @employee = current_employee
    @businesses = current_employee.business.all
  end

  def update
    @employee = current_employee
    @employee.update(employee_params)

    redirect_to employee_path(@employee)
  end

end
