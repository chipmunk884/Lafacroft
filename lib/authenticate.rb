class Authenticate
  def authenticate
    authenticate_or_request_with_http_basic do |user_name, password|
        user_name == "lafacroftadmin" && password == "coville123"
      end
  end
end