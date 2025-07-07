require 'rails_helper'

RSpec.describe RecipeFinder do
  let(:phrase) { "Arrabiata" }
  let(:current_user) { nil }
  subject { RecipeFinder.new(phrase, current_user:) }

  before do
    allow(Themealdb::Search).to receive(:call).and_return({
      "meals" => [
        {
          "idMeal" => "1",
          "strMeal" => "Spicy Arrabiata Penne",
          "strMealAlternate" => nil,
          "strCategory" => "Vegetarian",
          "strArea" => "Italian",
          "strInstructions" => "Bring a large pot of water to a boil. [...] "\
                               "Garnish with Parmigiano-Reggiano flakes and more basil and serve warm."
        }
      ]
    })
  end

  describe "#call" do
    context "when user was provided" do
      let(:current_user) { create(:user) }

      it "persists search" do
        expect { subject.call }.to change { Search.where(phrase:).count }.by(1)
      end
    end

    context "when user was not privded" do
      it "does not persist search" do
        expect { subject.call }.not_to change { Search.where(phrase:).count }
      end
    end

    it "persists recipes returned by the api call" do
      expect { subject.call }.to change { Meal.where(name: "Spicy Arrabiata Penne").count }.by(1)
    end

    it "returns recipies" do
      expect(subject.call).to match_array(
        have_attributes(
          name: "Spicy Arrabiata Penne"
        )
      )
    end
  end
end
