require_relative 'variant'

class Product
  attr_reader :id, :title, :handle, :body_html, :published_at,
    :created_at, :updated_at, :vendor, :product_type, :tags, :variants

  # Initialize product from JSON response
  def initialize(attributes = {})
    attributes.each do |key, value|
      instance_variable_set("@#{key}", value)
    end

    # Initialize product variants
    @variants = @variants.map { |variant| Variant.new(variant) }
  end

  def available_variants
    @variants.select(&:available)
  end
end
