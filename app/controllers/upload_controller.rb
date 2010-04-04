class UploadController < ApplicationController
  before_filter :authenticate
  def index
    @download = Download.new
  end

  def save
    @download = Download.new(params[:file])
    if @download.save
      redirect_to(:action => 'index', :id => @download.id)
    else
      redirect_to(:action => 'index')
    end
  end

  def view
    @download = Download.all
  end
  
  def download
    @download = Download.find(params[:id])
    send_data(@download.data,
              :filename => @download.name,
              :type => @download.content_type,
              :disposition => "attachment")
  end
  
  private
  def authenticate
    authenticate_or_request_with_http_basic do |user_name, password|
        user_name == "lafacroftadmin" && password == "coville123"
      end
  end
end
