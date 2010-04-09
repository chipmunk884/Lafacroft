class NspirefilesController < ApplicationController
  before_filter :login_required
  # GET /nspirefiles
  # GET /nspirefiles.xml
  def index
    @nspirefiles = Nspirefile.all(:order => "updated_at DESC")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @nspirefiles }
    end
  end

  # GET /nspirefiles/1
  # GET /nspirefiles/1.xml
  def show
    @nspirefile = Nspirefile.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @nspirefile }
    end
  end

  # GET /nspirefiles/new
  # GET /nspirefiles/new.xml
  def new
    @nspirefile = Nspirefile.new
    @categories = get_categories
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @nspirefile }
    end
  end

  # GET /nspirefiles/1/edit
  def edit
    @nspirefile = Nspirefile.find(params[:id])
    @categories = get_categories
  end

  # POST /nspirefiles
  # POST /nspirefiles.xml
  def create
    @nspirefile = Nspirefile.new(params[:nspirefile])

    respond_to do |format|
      if @nspirefile.save
        flash[:notice] = 'TI-Nspire file "' + @nspirefile.title + '" was successfully created.'
        format.html { redirect_to(@nspirefile) }
        format.xml  { render :xml => @nspirefile, :status => :created, :location => @nspirefile }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @nspirefile.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /nspirefiles/1
  # PUT /nspirefiles/1.xml
  def update
    @nspirefile = Nspirefile.find(params[:id])
    @categories = get_categories
    respond_to do |format|
      if @nspirefile.update_attributes(params[:nspirefile])
        flash[:notice] = 'TI-Nspire file "' + @nspirefile.title + '" was successfully updated.'
        format.html { redirect_to(@nspirefile) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @nspirefile.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /nspirefiles/1
  # DELETE /nspirefiles/1.xml
  def destroy
    @nspirefile = Nspirefile.find(params[:id])
    @nspirefile.destroy

    respond_to do |format|
      format.html { redirect_to(nspirefiles_url) }
      format.xml  { head :ok }
    end
  end
  private
  def get_categories
    ["Activities", "Algebra", "Assembly" ,"Calculus" ,"Games", "Geometry" ,"Libraries", "Middle School ", "Misc.", "Science", "Statistics"]
  end
end
