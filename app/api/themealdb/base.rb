module Themealdb
  class Base
    include HTTParty
    BASE_URL = "https://www.themealdb.com/api/json/v1"

    def self.full_url(path)
      return "#{BASE_URL}/#{path}.php" if Rails.env.production?

      "#{BASE_URL}/1/#{path}.php"
    end
  end
end
