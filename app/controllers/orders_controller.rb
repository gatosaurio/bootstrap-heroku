class OrdersController < ApplicationController
  def new
  	@products = Product.all 

  	respond_to do |format|
  		format.html # new.html.erb
  		format.json {render json: @products}
  	end
  end
end
