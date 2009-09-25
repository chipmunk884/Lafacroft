class HomeController < ApplicationController
  def index
    @posts = Post.all
    @files = Nspirefile.find(:all, :limit => 15)
  end
end
