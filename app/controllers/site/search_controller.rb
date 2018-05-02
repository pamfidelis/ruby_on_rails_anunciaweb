class Site::SearchController < SiteController
  def ads
    @ads = Ad.search_ads(params[:q])
    @categories = Category.all
  end
end
