class TutorialsController < ApplicationController
  def index
    @tutorials = Post.find(:all, :conditions => ["post_type = :posttype",{:posttype => "tutorial"}], :order => "created_at DESC")
  end
  def view
    @tutorial = Post.find(params[:id], :conditions => ["post_type = :posttype",{:posttype => "tutorial"}], :order => "created_at DESC")
  end

end
