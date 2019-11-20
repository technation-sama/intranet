class CategoriesController < ApplicationController

  def downloads
  	@categories = Category.all
  end
end
