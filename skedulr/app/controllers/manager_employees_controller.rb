class ManagerEmployeesController < ApplicationController
  def new
    session[:employee_id] ||= params[:employee][:id]
    @manager = Employee.find(session[:employee_id])

    @business = Business.find(session[:current_business_id])
    all_employees = @business.employees
    @managed_employees, @unmanaged_employees = all_employees.partition do |employee|
                                                 ManagerEmployee.exists?(
                                                   manager_id: @manager.id,
                                                   employee_id: employee.id,
                                                   business_id: @business.id
                                                 )
                                               end
  end

  def create
    @manager = ManagerEmployee.new(manager_id: session[:employee_id],
                                   employee_id: params[:id])
    puts params[:id]
    @manager.business = Business.find(session[:current_business_id])
    @manager.save

    respond_to do |format|
      format.html { redirect_to new_manager_employee_path }
      format.js
    end
  end

end
