class ApplicationController < ActionController::Base
  include Pundit

  rescue_from Pundit::NotAuthorizedUser, with: :user_not_authorized

  protect_from_forgery with: :exception

  layout :layout_by_resource

  protected

    def layout_by_resource
      if devise_controller? && resource_name == :admin
        "backoffice_devise"
      else
        "application"
      end
    end

    def user_not_authorized
      flas[:alert] = "You are not authorized to perform this action."
      redirect_to(request.referrer || root_path)
    end
end
