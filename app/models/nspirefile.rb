class Nspirefile < ActiveRecord::Base
  validates_presence_of :title, :message => "is required"
  validates_presence_of :description, :message => "is required"
  
  def search(search_term)
     queryterm = "%" + search_term + "%"
     return Nspirefile.all(:order => "updated_at DESC",:conditions => ["title LIKE ? OR author LIKE ? OR category LIKE ? OR description LIKE ?", queryterm, queryterm, queryterm, queryterm])
  end
  
end