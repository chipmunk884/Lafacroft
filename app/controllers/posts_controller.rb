class PostsController < ApplicationController
  before_filter :authenticate
  # GET /admin_posts
  # GET /admin_posts.xml
  def index
    @posts = Post.find(:all, :conditions => ["post_type = ?", "home"] ,:order => "created_at DESC")
    @tutorials = Post.find(:all, :conditions => ["post_type = ?", "tutorial"] ,:order => "created_at DESC")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @posts }
    end
  end

  # GET /admin_posts/1
  # GET /admin_posts/1.xml
  def show
    @post = Post.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @post }
    end
  end

  # GET /admin_posts/new
  # GET /admin_posts/new.xml
  def new
    @post = Post.new
    @types = post_types
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @post }
    end
  end

  # GET /admin_posts/1/edit
  def edit
    @post = Post.find(params[:id])
    @types = post_types
  end

  # POST /admin_posts
  # POST /admin_posts.xml
  def create
    @post = Post.new(params[:post])
    respond_to do |format|
      if @post.save
        flash[:notice] = 'Post was successfully created.'
        format.html { redirect_to(@post) }
        format.xml  { render :xml => @post, :status => :created, :location => @post }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @post.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /admin_posts/1
  # PUT /admin_posts/1.xml
  def update
    @post = Post.find(params[:id])

    respond_to do |format|
      if @post.update_attributes(params[:post])
        flash[:notice] = 'Post was successfully updated.'
        format.html { redirect_to(@post) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @post.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /admin_posts/1
  # DELETE /admin_posts/1.xml
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to(posts_url) }
      format.xml  { head :ok }
    end
  end
  
  private
  
  def authenticate
    authenticate_or_request_with_http_basic do |user_name, password|
        user_name == "lafacroftadmin" && password == "coville123"
      end
  end
  
  def post_types
    return %w[home tutorial]
  end
end
