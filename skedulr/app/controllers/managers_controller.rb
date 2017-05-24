class ManagersController < ApplicationController

  def index
    @managers = Manager.where(business_id: session[:current_business_id])

    @business = Business.find(session[:current_business_id])

    @employee_names = []
    @managers.each do |manager|
      employee = manager.find_employee
      @employee_names << "#{employee.first_name} #{employee.last_name}"
    end

  end

  def create
    @manager = Manager.create(business_id: @business.id, employee_id: @employee.id)
  end
end
