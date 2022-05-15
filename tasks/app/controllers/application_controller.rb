class ApplicationController < ActionController::Base
  include Pundit::Authorization

  helper_method :current_parrot

  def pundit_user
    current_parrot
  end

  def current_parrot
    Parrots::Description.new(session[:parrot])
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
