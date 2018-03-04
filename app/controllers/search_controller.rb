class SearchController < ApplicationController
  def index
    @search_terms = params[:q]
    @bands = Band.where('name LIKE "%' + @search_terms + '%"')
  end
end
