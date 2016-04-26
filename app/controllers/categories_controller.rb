class CategoriesController < ApplicationController
  def category
    @category = Category.find(params[:id])
  end
end
