class ShiftsController < ApplicationController
  include ShiftsHelper

  before_action :authenticate_employee!

  def index
    @first_name = current_employee.first_name
    @employee = current_employee
  end

  def create
    @shift = Shift.new(shift_params)
    @shift.employee_id = params[:employee_id]
    @shift.save

    redirect_to shifts_path
  end

  def new
    @shift= Shift.new
  end

  def edit
  end

end
