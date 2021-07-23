class Product < ApplicationRecord
  with_options presence: true do
    validates :name, uniqueness: true
    validates :description
    validates :price
    validates :quantity
  end

  has_many :related_products
  has_many :associated_products, through: :related_products, source: :related_product

  #Kaminari
  paginates_per 20
end
