require_relative '../event'
require_relative 'base'

module Topic 
  module Events
    module Users
      extend self
      extend Topic::Events::Base
      
      def favourite_new(source:, favourite_recipe_id:)
        data = {
          'favourite_recipe_id' => favourite_recipe_id.to_s
        }
        Topic::Event.new(source: source, name: Topic::USER_FAVOURITE_NEW , version: 1.0, data: data)      
      end

      def favourites_updated(source:, favourite_recipe_ids:)
        data = {
          'favourite_recipe_ids' => favourite_recipe_ids,
        }
        Topic::Event.new(source: source, name: Topic::USER_FAVOURITES_UPDATED, version: 1.0, data: data)      
      end

    end

  end
end
