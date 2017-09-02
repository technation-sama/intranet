class HomeController < ApplicationController
  def index
    @posts = Post.where(featured: "true" )
  end
end
