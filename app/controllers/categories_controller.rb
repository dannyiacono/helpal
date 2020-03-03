class CategoriesController < ApplicationController

  def index
    @categories = policy_scope(Category)
    @request = Request.new
    if params[:commit]
      @user_category_selection = params[:commit]
      @category = Category.where(name: @user_category_selection)
      @id = @category.ids
      @request = Request.new(category_id: @id)
    end

  end
end
