class SearchController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @meals = RecipeFinder.new(params[:search]).call
    @bookmarks = Bookmark.where(user: current_user, meal: @meals)

    respond_to do |format|
      format.json { render json: @meals }
      format.html
    end
  end
end
