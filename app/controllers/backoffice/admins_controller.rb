class Backoffice::AdminsController < BackofficeController
  before_action :set_admin, only: [:edit, :update]
  after_action :verify_authorized, only: :new
  after_action :verify_policy_scoped, only: :index

  def index
    @admins = policy_scope(Admin)
  end

  def new
    @admin = Admin.new
    aothorize @admin
  end

  def create
    @admin = Admin.new(params_admin)
    if @admin.save
      redirect_to backoffice_admins_path, notice: "O Administrador #{@admin.email} foi cadastrada com sucesso"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @admin.update(params_admin)
      redirect_to backoffice_admins_path, notice: "O Administrador #{@admin.email} foi atualizada com sucesso"
    else
      render :edit
    end
  end

  def destroy
    admin_email = @admin.email

    if @admin.destroy
      redirect_to backoffice_admins_path, notice: "O Administrador #{admin.email} foi removido com sucesso"
    else
      render :index
    end
  end

  private

  def set_admin
    @admin = Admin.find(params[:format])
  end

  def params_admin
    passwd = params[:admin][:password]
    password_confirmation = params[:admin][:password_confirmation]

    if passwd.blank? && password_confirmation.blank?
      params[:admin].except!(:password, :password_confirmation)
    end

    params.require(:admin).permit(policy(@admin).permitted_attributes)
  end
end
