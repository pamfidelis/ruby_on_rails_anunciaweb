class Backoffice::CategoriesController < BackofficeController
  before_action :set_category, only: [:edit, :update]
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Categoryservice.create(params_category)
    
    unless @category.errors_any?
      redirect_to backoffice_categories_path, notice: "A categoria #{@category.description} foi cadastrada com sucesso"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @category.update(params_category)
      redirect_to backoffice_categories_path, notice: "A categoria #{@category.description} foi atualizada com sucesso"
    else
      render :edit
    end
  end

  private

  def set_category
    @category = Category.find(params[:format])
  end


  def params_category
    params.require(:category).permit(:description)
  end

end
