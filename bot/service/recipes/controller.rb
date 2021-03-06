require 'topic/events/recipes'

module Service
  module Recipe
    module Controller
      def self.call(bot_request)
        case bot_request.name
        when Topic::RECIPE_SEARCH_REQUESTED 
          require_relative 'spoonacular/free_text_search'
          Service::Recipe::Spoonacular::FreeTextSearch.call(bot_request)
        when Topic::FAVOURITES_SEARCH_REQUESTED 
          require_relative 'spoonacular/favourites_search'
          Service::Recipe::Spoonacular::FavouritesSearch.call(bot_request)
        when Topic::USER_FAVOURITES_UPDATED
          require_relative 'favourites'
          Service::Recipe::Favourite.call(bot_request)
        else
          raise "unexpected event name #{bot_request.name}"
        end
      end
    end
  end
end
