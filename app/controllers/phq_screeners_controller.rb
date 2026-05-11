class PhqScreenersController < ApplicationController
  def new
  end

  def create
    redirect_to check_in_path
  end
end