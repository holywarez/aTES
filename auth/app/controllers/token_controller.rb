# frozen_string_literal: true

class TokenController < ApplicationController
  before_action :authenticate_parrot!

  def obtain
    redirect_to back_url(Parrots::JwtToken.new(current_parrot))
  end

  private

  def back_url(token)
    uri = URI.parse(params[:back_url].to_s)
    query = URI.decode_www_form(uri.query.to_s) << ['token', token]
    uri.query = URI.encode_www_form(query)
    uri.to_s
  end
end
