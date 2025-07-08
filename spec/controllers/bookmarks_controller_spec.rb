require 'rails_helper'

RSpec.describe BookmarksController, type: :controller do
  let!(:user) { create(:user) }

  let!(:meal) do
    create(:meal,
      name: "Spicy Arrabiata Penne",
      description: "Bring a large pot of water to a boil. [...] Garnish with Parmigiano-Reggiano flakes and more basil and serve warm."
    )
  end

  let!(:meal2) do
    create(:meal,
      name: "Spaghetti Bolognese",
      description: "Put the onion and oil in a large pan and fry over a fairly high heat for 3-4 mins."
    )
  end

  before do
    sign_in user
  end

  describe "POST #create" do
    it "allows a user to mark a meal as a favourite" do
      expect {
        post :create, params: { meal_id: meal.id }
      }.to change {
        Bookmark.count
    }.by(1)
    end
  end

  describe "DELETE #destroy" do
    let!(:bookmark) { create(:bookmark, user: user, meal:) }

    it "allows a user to unmark a meal as favourite" do
      expect {
        delete :destroy, params: { id: bookmark.id }, format: :json
      }.to change {
        Bookmark.count
      }.by(-1)
    end
  end
end
