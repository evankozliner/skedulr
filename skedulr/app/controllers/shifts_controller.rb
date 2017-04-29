class ShiftsController < ApplicationController

  before_action :authenticate_employee!

  def index
    @first_name = current_employee.first_name
  end
end
