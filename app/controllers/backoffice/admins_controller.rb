class Backoffice::AdminsController < BackofficeController
  before_action :set_admin, only: [:edit, :update]

  def index
    @admins = Admin.all
  end

  def new
    @admin = Admin.new
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
    passwd = params[:admin][:password]
    password_confirmation = params[:admin][:password_confirmation]

    if passwd.blank? && password_confirmation.blank?
      params[:admin].delete(:password)
      params[:admin].delete(:password_confirmation)
    end

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
    params.require(:admin).permit(:email, :password, :password_confirmation)
  end
end
