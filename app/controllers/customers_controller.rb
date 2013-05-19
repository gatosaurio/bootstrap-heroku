class CustomersController < ApplicationController
  
  before_filter :authenticate_user!

  def index
  	@customers = current_user.customers
  end

  def new
  	@customer = Customer.new
  end

  def create
  	@customer = current_user.customers.build(params[:customer])
  	if @customer.save
  		flash[:notice] = "Customer Created"
  		redirect_to customers_path
  	else
  		render 'new'
  	end
  end

  def show
  	@customer = current_user.customers.find(params[:id])
  end

  def edit
  	@customer = current_user.customers.find(params[:id])
  end

  def update
  	@customer = current_user.customers.find(params[:id])
  	if 
  		@customer.update_attributes(params[:customer])
  		flash[:notice] = "Customer Edited"
  		redirect_to customer_path
  	else
  		render 'edit'
  	end
  end

  def destroy
  	@customer = current_user.customers.find(params[:id]).destroy
  	redirect_to root_url, :notice => 'Customer Deleted'
  end

  def search
    @customers = current_user.customers.search(params)
    @customer = Customer.new

    if @customers.any?
      flash[:notice] = "Customer found!"
    else
      flash[:success] = "Customer wasn't found, add it DUDE"

    end

  end

end
