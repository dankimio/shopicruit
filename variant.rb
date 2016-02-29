class Variant
  attr_reader :id, :title, :option1, :option2, :option3, :price, :grams,
              :compare_at_price, :sku, :requires_shipping, :taxable, :position,
              :product_id, :created_at, :updated_at, :available, :featured_image

  # Initialize product from JSON response
  def initialize(attributes = {})
    attributes.each do |key, value|
      instance_variable_set("@#{key}", value)
    end

    @price = @price.to_f
  end
end
