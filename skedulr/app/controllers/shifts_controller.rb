class ShiftsController < ApplicationController
  include ShiftsHelper

  before_action :authenticate_employee!

  def index
    @first_name = current_employee.first_name
    @employee = current_employee
    if current_employee.business_id.blank?
      redirect_to new_business_path
    else
      @business = Business.find(current_employee.business_id)
    end
  end

  def create
    @shift = Shift.new(shift_params)
    @shift.employee_id = current_employee.id
    if !@shift.save
      puts @shift.errors.full_messages
    end

    redirect_to shifts_path
  end

  def new
    @shift= Shift.new
  end

  def edit
  end

end
