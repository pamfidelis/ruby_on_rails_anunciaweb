class Site::AdDetailsController < SiteController
  before_action :set_ad, only: [:show]

  def show
  end

  private
    def set_ad
      @ad = Ad.find(params[:id])
    end

    def params_ad
      params.require(:ad).permit(:id, :title, :category_id, :price, :description, :picture, :finish_date)
    end
end
