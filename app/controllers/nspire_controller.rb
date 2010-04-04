class NspireController < ApplicationController
  def index
    @nspirefiles = params[:search_term].nil? == false ? Nspirefile.search(params[:search_term]) : Nspirefile.all(:order => "updated_at DESC");
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @nspirefile }
      end
  end
end
