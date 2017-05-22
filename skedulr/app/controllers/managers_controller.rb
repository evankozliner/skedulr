class ManagersController < ApplicationController
  def create
    @manager = Manager.create(business_id: @business.id, employee_id: @employee.id)
  end
end
