class EmployeesController < ApplicationController
  include EmployeesHelper

  before_action :authenticate_employee!

  def index
    @employee = current_employee

    if @employee.first_name.blank? || @employee.last_name.blank?
      redirect_to edit_employee_path(@employee)
    elsif @employee.businesses.count
      @businesses = @employee.businesses
    else
      redirect_to businesses_path
    end

    session[:manager] = false
    session[:employee_id] = nil
    session[:current_business_id] = nil
  end

  def create
    @employee = current_employee
    @employee.update(employee_params)
  end

  def edit
    if session[:manager]
      @employee = Employee.find(params[:id])
    else
      @employee = current_employee
    end
  end

  def show
    @employee = current_employee
    @businesses = @employee.business
  end

  def update
    if session[:manager]
      @employee = Employee.find(params[:id])
    else
      @employee = current_employee
    end

    @employee.update(employee_params)

    redirect_to employees_path
  end

end
