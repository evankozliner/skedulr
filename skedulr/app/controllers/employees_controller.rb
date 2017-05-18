class EmployeesController < ApplicationController
  include EmployeesHelper

  def index
    @employee = current_employee

    if @employee.first_name.blank? || @employee.last_name.blank?
      redirect_to edit_employee_path(@employee)
    elsif Business.exists?(current_employee.business)
      @businesses = @employee.business
    else
      redirect_to businesses_path
    end

    session[:current_business_id] = nil

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
