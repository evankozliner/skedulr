class BusinessesController < ApplicationController
  include BusinessesHelper

  def create
    @business = Business.new(business_params)
    @business.save

    #Attach new business to current employee
    current_employee.update(business_id: @business.id)

    #Should probably test if the employee profile has been filled out to
    #determine where to redirect
    if current_employee.first_name.blank? || current_employee.last_name.blank?
      redirect_to edit_employee_path(current_employee)
    end
  end

  def new
    @business = Business.new
  end
end
