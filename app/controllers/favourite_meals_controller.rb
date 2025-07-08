class FavouriteMealsController < ApplicationController
  def index
    @favourite_meals = current_user.bookmarks.includes(:meal)

    respond_to do |format|
      format.json do
        render plain: (@favourite_meals.map do |bookmark|
          {
            bookmark_id: bookmark.id,
            meal: bookmark.meal
          }
        end.to_json)
      end
      format.html
    end
  end
end
