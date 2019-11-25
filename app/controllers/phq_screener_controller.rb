class PhqScreenerController < ApplicationController
  def new
  end

  def create
    redirect_to new_phq_screener_path
  end

end
