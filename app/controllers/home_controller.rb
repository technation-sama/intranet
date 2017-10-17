class HomeController < ApplicationController
  def index
    @posts = Post.where(featured: "true" ).limit(3)
    @events = Event.all
  end
end
