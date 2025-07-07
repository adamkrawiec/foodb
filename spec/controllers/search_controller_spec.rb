require 'rails_helper'

RSpec.describe SearchController, type: :controller do
  let(:user) { create(:user) }

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

  describe "GET #index" do
    before do
      allow_any_instance_of(RecipeFinder).to receive(:call).and_return(Meal.all)
    end

    it "returns recipies matching the search phrase" do
      get :index, params: { search: "arrabiata" }, format: :json

      parsed_body = JSON.parse(response.body)

      expect(parsed_body).to include(
        hash_including(
          "name"=>"Spicy Arrabiata Penne"
        )
      )
    end
  end
end
