require_relative 'api'

class Shopicruit
  PRODUCT_TYPES = %w(Computer Keyboard)
  GRAMS_IN_KILOGRAMS = 1000
  CAPACITY = 100 * GRAMS_IN_KILOGRAMS

  def initialize(products)
    @products = products
    @packed_variants = []
  end

  def solve
    pack_variants
    @packed_variants.inject(0) { |sum, variant| sum + variant.price }
  end

  private

  # Greedy pack variants
  def pack_variants
    available_variants.inject(0) do |sum, variant|
      weight = sum + variant.grams
      break if weight > CAPACITY
      @packed_variants << variant
      weight
    end
  end

  # List available variants ordered by weight
  def available_variants
    filtered_products.flat_map(&:available_variants).sort_by(&:grams)
  end

  # Include products from predefined categories
  def filtered_products
    @products.select { |product| PRODUCT_TYPES.include?(product.product_type) }
  end
end

puts Shopicruit.new(API.products).solve
