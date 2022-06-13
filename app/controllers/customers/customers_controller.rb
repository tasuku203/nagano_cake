class Customers::CustomersController < ApplicationController
  def show
    @customer = Current_customer
    
  end
  
  def edit
    @customer = Current_customer
  end
  
  def update
  end
  
  def confirm
  end
  
  def destroy
  end
end
