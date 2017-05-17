class EmployeesController < ApplicationController
  include EmployeesHelper

  def index
    @employee = current_employee
    @businesses = @employee.business
  end

  def create
    @employee = current_employee
    @employee.update(employee_params)
  end

  def edit
    @employee = current_employee
  end

  def show
    @employee = current_employee
    @businesses = @employee.business
  end

  def update
    @employee = current_employee
    @employee.update(employee_params)

    redirect_to employees_path
  end

end
