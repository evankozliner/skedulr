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
    @current_employee = current_employee
    @managed_employee = Employee.find(params[:id])
    @business = Business.find(session[:current_business_id])
    @shifts = Shift.where(business_id: @business.id, employee_id: @managed_employee.id)
  end

  def update
    @employee = current_employee
    @employee.update(employee_params)

    redirect_to employees_path
  end

end
