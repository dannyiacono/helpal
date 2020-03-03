class CategoriesController < ApplicationController

  def index
    @categories = policy_scope(Category)
    @request = Request.new

    if params[:commit]
      @user_category_selection = params[:commit]
      @category = Category.find_by(name: @user_category_selection)
      @id = @category.id
      @request = Request.new(category_id: @id)

    end
  end
end
