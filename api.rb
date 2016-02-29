require 'httparty'
require_relative 'product'

class API
  PRODUCTS_URL = 'http://shopicruit.myshopify.com/products.json'

  def self.products
    HTTParty.get(PRODUCTS_URL, format: :json)['products'].map { |product| Product.new(product) }
  end
end
