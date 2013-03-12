class SiteController < ApplicationController

  def index
    render :index
  end

  def search_results
    @all_most_recent = Festival.search(params[:search])
    @all_less_recent = Festival.search(params[:search])

    render :search
  end

  def search_index
    if params[:search_results]
      redirect_to :action => "search_results"
    else
      render :search
    end
  end

end
