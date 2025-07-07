class BookmarksController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    if current_user.bookmarks.create(meal_id: params[:meal_id])
      head :ok
    else
      head :bad_request
    end
  end

  def destroy
    current_user.bookmarks.find(params[:id]).destroy
  end
end
