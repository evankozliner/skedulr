class ShiftsController < ApplicationController
  include ShiftsHelper

  before_action :authenticate_employee!

  def index
    @first_name = current_employee.first_name
    @employee = current_employee

    session[:current_business_id] ||= params[:shift][:business_id]
    @business = Business.find(session[:current_business_id])

    @shifts = Shift.where("business_id = ? AND employee_id = ?", @business.id, @employee.id)
  end

  def create
    @shift = Shift.new(shift_params)
    @shift.employee_id = current_employee.id
    @shift.business_id = session[:current_business_id]
    puts session[:current_business_id]
    if !@shift.save
      puts @shift.errors.full_messages
    end

    redirect_to shifts_path
  end

  def new
    @shift= Shift.new
    @shift.start = DateTime.now
    @shift.stop = DateTime.now
  end

  def edit
  end



end
