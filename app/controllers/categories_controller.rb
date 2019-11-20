class CategoriesController < ApplicationController
  include SamaIPFilters
  def downloads
  	@categories = Category.all
  end
end
