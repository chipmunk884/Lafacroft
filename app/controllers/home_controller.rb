class HomeController < ApplicationController
  def index
    @posts = Post.all(:conditions => ["post_type = ?","home"], :order => "created_at DESC")
    @files = Nspirefile.find(:all, :limit => 15, :order => "created_at DESC")
  end
end
