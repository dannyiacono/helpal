class CategoriesController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    if !params[:query].nil?
      @location = params[:query].split(",")
    end
    @categories = policy_scope(Category)
    @request = Request.new
    if params[:commit] && (params[:commit] != "Search" && "Select location" && "Confirm location")
      @user_category_selection = params[:commit]
      @category = Category.find_by(name: @user_category_selection)
      @request = Request.new(city: @location)
    end

  end
end
