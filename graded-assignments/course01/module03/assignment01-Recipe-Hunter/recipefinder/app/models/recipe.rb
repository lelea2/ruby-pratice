class Recipe < ActiveRecord::Base
  include HTTParty

  key_value = ENV['FOOD2FORK_KEY'] || '0c0ede5e194a25e2d87eab6f47cbb467'
  hostport = ENV['FOOD2FORK_SERVER_AND_PORT'] || 'www.food2fork.com'
  base_uri "http://#{hostport}/api/search"
  default_params key: key_value
  format :json

  def self.for term
    get("", query: { q: term})["recipes"]
  end
end
