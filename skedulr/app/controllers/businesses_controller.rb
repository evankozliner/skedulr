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
    current_employee.update(business_id: @business.id)

    #Should probably test if the employee profile has been filled out to
    #determine where to redirect
    redirect_to shifts_path
  end

  def new
    @business = Business.new
  end

  def edit
  end
end
