json.extract! product, :id, :name, :description, :price, :quantity, :created_at, :updated_at

if params[:action] == 'show'
  json.related_prooducts do
    json.id product.id
    json.name product.name
    json.price product.price
  end
end
