module BusinessesHelper
  def business_params
    params.require(:business).permit(:name, :term, :employee_id)
  end
end
