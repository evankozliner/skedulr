class ManagersController < ApplicationController

  def index
    @managers = Manager.where(business_id: session[:current_business_id])

    @business = Business.find(session[:current_business_id])
  end

  def create
    @manager = Manager.create(business_id: session[:current_business_id],
                              employee_id: params[:employee][:id])
  end

  def new
    @business = Business.find(session[:current_business_id])
    @employees = Employee.where(business_id: @business.id).
                          select do |employee|
                            employee.is_manager?(@business.id)
                          end
  end

end
