class CategoriesController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @location = params[:query]

    if @location.nil?
      flash[:notice] = "Please select a city first!"
    else
      @location.split(",").first
    end
    @categories = policy_scope(Category)
    @request = Request.new
    if params[:commit] && params[:commit] != "Search"
      @user_category_selection = params[:commit]
      @category = Category.find_by(name: @user_category_selection)
      @request = Request.new(city: params[:query])
    end

  end
end
