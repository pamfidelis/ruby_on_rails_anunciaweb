class Site::Profile::AdsController < Site::ProfileController
  def index
    @ads = Ad.member_current(current_member)
  end
end
