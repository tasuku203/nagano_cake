class Customers::AdressController <
  before_action :authenticate_user!

  def index
    @address = Address.all
  end

  def edit
  end

  def create
    address = Address.new
    address.save

  end

  def update
  end

  def destroy
  end
end
