class Site::CategoriesController < SiteController
  def show
    @categories = Category.order(:description)
    @ads = Ad.where_category(params[:id])
  end
end
