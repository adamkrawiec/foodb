module Themealdb
  class Search < Base
    def self.call(search)
      JSON.parse(get(full_url("search"), { query: { s: search } }).body)
    end
  end
end
