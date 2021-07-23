class RelatedProduct < ApplicationRecord
  belongs_to :product, class_name: "Product"
  belongs_to :related_product, class_name: "Product"

  validate :check_related_product
  validate :check_duplicated_product

  private

  def check_related_product
    errors.add(:related_product_id, 'cannot be the same product.') if product_id == related_product_id
  end

  def check_duplicated_product
    errors.add(
      :related_product_id, 'cannot associate twice.'
    ) if product.associated_products.include? Product.find(related_product_id)
  end
end
