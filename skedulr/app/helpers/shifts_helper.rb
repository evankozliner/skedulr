module ShiftsHelper
  def shift_params
    params.require(:shift).permit(:start, :stop, :employee_id, :business_id)
  end
end
