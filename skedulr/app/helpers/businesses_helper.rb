module BusinessesHelper
  def business_params
    params.require(:business).permit(:name, :term)
  end
end