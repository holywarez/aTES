# frozen_string_literal: true

class TasksController < ApplicationController
  before_action :authenticate_parrot!

  def index
  end
end
