class ProductsController < ApplicationController
  before_action :set_product, only: %i[show update destroy]

  rescue_from ActiveRecord::RecordNotFound do |error|
    render json: { errors: [error.message] }, status: :not_found
  end

  def index
    @q = Product.ransack(params[:q])
    @products = @q.result.order(order_products).page(params[:page]).per(results_per_page)
  end

  def show; end

  def create
    @product = Product.new(product_params)

    if @product.save
      render :show, status: :created, location: @product
    else
      render json: { errors: @product.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if @product.update(product_params)
      render :show, status: :ok, location: @product
    else
      render json: { errors: @product.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @product.destroy
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :description, :price, :quantity)
  end

  def results_per_page
    params[:per] = params[:per].to_i > 100 ? 100 : params[:per]
  end

  def order_products
    if Product.column_names.include? params[:order_attribute]
      "#{params[:order_attribute]} #{params[:order]}"
    else
      "id ASC"
    end
  end
end
