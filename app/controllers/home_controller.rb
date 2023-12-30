class HomeController < ApplicationController
  def index
    @properties = Property.includes(:community).page(params[:page])
  end
end
