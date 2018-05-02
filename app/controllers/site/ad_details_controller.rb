class Site::AdDetailsController < SiteController
  def show
    @ad = Ad.find(params[:id])
    @categories = Category.order_by_description(params[:description])
  end
end
