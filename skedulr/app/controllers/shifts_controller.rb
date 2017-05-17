class ShiftsController < ApplicationController
  include ShiftsHelper

  before_action :authenticate_employee!

  def index
    @first_name = current_employee.first_name
    @employee = current_employee

    if @employee.first_name.blank? || @employee.last_name.blank?
      redirect_to edit_employee_path(@employee)
    elsif Business.exists?(current_employee.business)
      @business = Business.find(params[:shift][:business_id])
    else
      redirect_to businesses_path
    end
    @shifts = Shift.where("business_id = ? AND employee_id = ?", @business.id, @employee.id)
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
