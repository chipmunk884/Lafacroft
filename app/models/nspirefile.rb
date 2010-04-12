class Nspirefile < ActiveRecord::Base
  validates_presence_of :title, :message => "is required"
  validates_presence_of :description, :message => "is required"
  
  CATEGORIES = ["Activities", "Algebra", "Assembly" ,"Calculus" ,"Games", "Geometry" ,"Libraries", "Middle School ", "Misc.", "Science", "Statistics"]
  
end