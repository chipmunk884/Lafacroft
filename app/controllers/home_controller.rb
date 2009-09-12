class HomeController < ApplicationController
  def index
    @posts = Post.all
    @files = Nspirefile.all
  end
end
