module EmployeeHelper
  def employee_params
    params.require(:employee).permit(:first_name, :last_name, :email, :is_manager, :encrypted_password, :manager_table_id)
  end
end
