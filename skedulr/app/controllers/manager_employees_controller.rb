class ManagerEmployeesController < ApplicationController
  def new
    @manager = ManagerEmployee.new

    session[:employee_id] = params[:employee][:id]
    @employee = Employee.find(session[:employee_id])

    @business = Business.find(session[:current_business_id])
    @business_employees = @business.employees
  end

  def create
    employee_ids = params[:manager_employee][:employee_ids].select do |x|
                     x.length
                   end

    employee_ids.each do |employee_id|
      if employee_id == session[:employee_id]
        flash.now[:error] = "Cannot be own manager"
      elsif ManagerEmployee.exists?(manager_id: employee_id,
                                    employee_id: session[:employee_id])
        flash.now[:error] = "#{Employee.find(employee_id)} is your manager"
      else
        @manager = ManagerEmployee.new(manager_id: session[:employee_id],
                                          employee_id: employee_id)
        @manager.business = Business.find(session[:current_business_id])
        @manager.save
      end
    end

      redirect_to business_path(session[:current_business_id])
  end

  def edit
  end

  def update
  end
end
