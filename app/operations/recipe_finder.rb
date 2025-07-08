# TODO: relate search to meals
# loop and persist recipes in a job
class RecipeFinder
  def initialize(phrase, current_user: nil, api_client: Themealdb::Search)
    @phrase = phrase
    @current_user = current_user
    @api_client = api_client
  end

  def call
    return Meal.none unless phrase

    Meal.transaction do
      persist_search
      persist_recipies
    end
  end

  attr_reader :phrase, :current_user, :api_client

  def persist_search
    return unless current_user

    current_user.searches.find_or_create_by(phrase:)
  end

  def persist_recipies
    recipiees = api_client.call(phrase)
    return Meal.none if recipiees["meals"].blank?

    recipiees["meals"].map do |recipee|
      meal = Meal.find_by(name: recipee["strMeal"])
      next meal if meal

      Meal.create(
        name: recipee["strMeal"],
        description: recipee["strInstructions"]
      )
    end
  end
end
