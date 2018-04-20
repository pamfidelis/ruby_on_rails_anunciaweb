class Backoffice::CategoriesController::CategoryService
  attr_accessor :category

  extend self

  def create!(params_category)
    @category = Category.new(params_category)

    if @category.valid?
      @category.save!
    end

    @category
  end
end
