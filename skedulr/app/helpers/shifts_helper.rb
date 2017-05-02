module ShiftsHelper
  def shift_params
    params.require(:shift).permit(:start, :stop)
  end
end
