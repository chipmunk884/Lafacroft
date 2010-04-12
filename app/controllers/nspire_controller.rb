class NspireController < ApplicationController
  def index
    @nspirefiles = params[:search_term].nil? ? Nspirefile.all(:order => "updated_at DESC") : search(params[:search_term])
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @nspirefile }
    end
  end

  def fixarchive
    nspirefile = Nspirefile.all
    nspirefile.each do |file|
      url = file.file_url
      tns = url[/\w*\.tns/]
      zip = url[/\w*\.zip/]

      if (tns != nil)
        file.file_url = tns
      elsif (zip !=nil)
        file.file_url = zip
      else
        file.file_url = ""
      end
      file.save
    end
    render :text => "Archive fixed"
  end

  private
  def search(search_term)
     queryterm = "%" + search_term + "%"
     return Nspirefile.all(:order => "updated_at DESC",:conditions => ["title LIKE ? OR author LIKE ? OR category LIKE ? OR description LIKE ?", queryterm, queryterm, queryterm, queryterm])
  end

end
