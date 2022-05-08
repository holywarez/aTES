class ApplicationController < ActionController::Base
  helper_method :current_parrot

  def current_parrot
    session[:parrot]
  end

  def authenticate_parrot!
    return if current_parrot.present?

    redirect_to authentication_url
  end

  def authentication_url
    uri = URI.parse(ENV['AUTH_URL'])
    query = URI.decode_www_form(uri.query.to_s) << ['back_url', check_auth_url]
    uri.query = URI.encode_www_form(query)
    uri.to_s
  end
end
