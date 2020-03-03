class CategoriesController < ApplicationController

  def index
    @categories = policy_scope(Category)
  end
end
