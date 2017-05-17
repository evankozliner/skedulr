class BusinessesController < ApplicationController
  include BusinessesHelper

  def index
    @businesses = Business.search(params[:term])
    @employee = current_employee
  end

  def create
    @business = Business.new(business_params)
    @business.save

    #Attach new business to current employee
    @employee = current_employee
    @relation = BusinessEmployeeRelation.new(employee_id: @employee.id, business_id: @business.id)
    @relation.save

    #Should probably test if the employee profile has been filled out to
    #determine where to redirect
    redirect_to employees_path
  end

  def new
    @business = Business.new
  end

  def edit
  end

  def update
    @employee = current_employee
    @business = Business.find(params[:id])
    @relation = BusinessEmployeeRelation.new(employee_id: @employee.id, business_id: @business.id)
    @relation.save

    redirect_to employees_path
  end

  def destroy
    @employee = current_employee
    @business = Business.find(params[:id])
    @relation = BusinessEmployeeRelation.where("business_id = ? AND employee_id = ?", @business.id, @employee.id)

    BusinessEmployeeRelation.destroy(@relation.ids)

    redirect_to employees_path
  end
end
