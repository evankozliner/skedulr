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
    if find_business_employee_relation(@business.id,@employee.id).empty?
      @employee.businesses << @business
    end

    redirect_to employees_path
  end

  def show
    @business = Business.find(params[:id])
    @employee = current_employee
    @employees = @business.employees
    @managers = @employees.select { |x| x.is_manager?(@business.id) }

    sorted_employees = @employees.partition do |employee|
                           ManagerEmployee.exists?(business_id: @business.id,
                                                   manager_id: @employee.id,
                                                   employee_id: employee.id) ||
                           employee.eql?(@employee)
                         end

    @managed_employees = sorted_employees[0]
    @employees = sorted_employees[1]

    session[:manager] = @employee.id
    session[:employee_id] = nil
    session[:current_business_id] = params[:id]
  end

  def destroy
    @business = Business.find(params[:id])

    @business.destroy

    redirect_to businesses_path
  end


  def destroy_relation
    @employee = current_employee
    @business = Business.find(params[:id])
    @relation = find_business_employee_relation(@business.id, @employee.id)

    BusinessEmployeeRelation.destroy(@relation.ids)

    redirect_to employees_path
  end

  private

  def find_business_employee_relation(business_id, employee_id)
    BusinessEmployeeRelation.where("business_id = ? AND employee_id = ?", business_id, employee_id)
  end
end
