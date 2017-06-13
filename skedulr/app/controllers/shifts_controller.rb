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
    shift_values = params[:shift]
    @shift = Shift.new(start: parse_date(shift_values[:start]), 
                       stop: parse_date(shift_values[:stop]),
                       employee_id: current_employee.id,
                       business_id: session[:current_business_id])

    puts "START"
    puts @shift.start

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

  def parse_date date
    DateTime.strptime(date, "%m/%d/%Y %l:%M %p")
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
