class CategoriesController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @categories = policy_scope(Category)
    @request = Request.new
    if params[:commit] && params[:commit] != "Search"
      @user_category_selection = params[:commit]
      @category = Category.find_by(name: @user_category_selection)
      @id = @category.id
      @request = Request.new(category_id: @id)
    elsif params[:commit] == "Search"
      redirect_to categories_path
    end
  end
end
