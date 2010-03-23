class HomeController < ApplicationController
  def index
    @posts = Post.find(:all, :conditions => ["post_type = :posttype",{:posttype => "home"}], :order => "created_at DESC")
    @files = Nspirefile.find(:all, :limit => 15, :order => "id")
  end
end
