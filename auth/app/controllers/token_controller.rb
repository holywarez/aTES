# frozen_string_literal: true

class TokenController < ApplicationController
  before_action :authenticate_parrot!

  def obtain
    render plain: Parrots::JwtToken.new(current_parrot), layout: false
  end
end
