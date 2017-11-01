class HomeController < ApplicationController
  def index
    @posts = Post.where(featured: "true", published: "true" ).page(params[:page]).per(5)
    @events = Event.all
  end
end
