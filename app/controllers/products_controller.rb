class ProductsController < ApplicationController
  def index
  	@products = current_user.products
  end

  def new
  	@product = Product.new
  end

  def create
  	@product = current_user.products.build(params[:product])
  	if @product.save
  		flash[:notice] = "Product created"
  		redirect_to products_path
  	else
  		render 'new'
  	end
  end

  def edit
  	@product = current_user.products.find(params[:id])
  end

  def update
  	@product = current_user.products.find(params[:id])
  	if 
  		@product.update_attributes(params[:product])
  		flash[:notice] = "Product Edited"
  		redirect_to product_path
  	else
  		render 'edit'
  	end
  end

  def show
  	@product = current_user.products.find(params[:id])
  end

  def destroy
  	@product = current_user.products.find(params[:id]).destroy
  	redirect_to products_path
  end
end
