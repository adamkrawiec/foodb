require 'rails_helper'

RSpec.describe FavouriteMealsController, type: :controller do
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

  let!(:bookmark) do
    create(:bookmark, user: user, meal:)
  end

  before do
    sign_in user
  end

  describe "GET #index" do
    it "returns meals that were bookmarked by a user" do
      get :index, format: :json

      parsed_body = JSON.parse(response.body)

      expect(parsed_body).to match_array(
        hash_including(
          "bookmark_id" => bookmark.id,
          "meal" => hash_including(
            "name" => meal.name
          )
        )
      )
    end
  end
end
