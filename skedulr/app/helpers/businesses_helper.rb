module BusinessesHelper
  def business_params
    params.require(:business).permit(:name, :term, :employee_id, :id)
  end
end
