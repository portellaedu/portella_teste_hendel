class RelatedProductsController < ApplicationController

  def create
    @related_product = RelatedProduct.new(related_product_params)
    @related_product.product = product

    if @related_product.save
      render :create, status: :created
    else
      render json: { errors: @related_product.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @product = Product.find(params[:product_id])
    @related_product = @product.related_products.find_by(related_product_id: params[:id])
    @related_product.destroy if @related_product.present?
  end

  private

  def related_product_params
    params.require(:related_product).permit(:related_product_id)
  end

  def product
    Product.find(params[:product_id])
  end

end