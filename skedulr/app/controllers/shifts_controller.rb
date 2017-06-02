class ShiftsController < ApplicationController
  include ShiftsHelper

  def index
    if session[:manager]
      session[:employee_id] ||= params[:employee][:id]
      @employee = Employee.find(session[:employee_id])
    else
      @employee = current_employee
    end

    @first_name = @employee.first_name

    if !session[:current_business_id]
      session[:current_business_id] = params[:shift][:business_id]
    end

    @business = Business.find(session[:current_business_id])

    @shifts = Shift.where(business_id: @business.id, employee_id: @employee.id)
  end

  def create
    @shift = Shift.new(shift_params)

    if session[:manager]
      @shift.employee_id = session[:employee_id]
    else
      @shift.employee_id = current_employee.id
    end

    @shift.business_id = session[:current_business_id]
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

  def get_shifts_by_business
    shift_data = Shift.where(employee_id: current_employee.id,
                             business_id: params[:business_id])
    render json: shift_data.pluck(:start, :stop)
  end
end
