class SiteController < ApplicationController

  def index
    render :index
  end

  def search
    @all_most_recent = Festival.search(params[:search])
  end

end
