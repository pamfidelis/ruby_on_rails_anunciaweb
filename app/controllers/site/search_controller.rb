class Site::SearchController < SiteController
  def ads
    @ads = Ad.search_ads(params[:q], params[:page])
    @categories = Category.all
  end
end
