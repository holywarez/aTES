# frozen_string_literal: true

class AuthController < ApplicationController
  def check
    if params[:token].blank?
      redirect_to authentication_url
      return
    end

    session[:parrot] = Parrots::JwtPayload.new(params[:token])
    redirect_to root_path
  end
end
