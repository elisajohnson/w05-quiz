# def update
    # find beverage you wish to edit by id
    # @beverage = Beverage.find(params[:id]
    # pasted from create
    # same process as create but changed helper method to update_attributes
    # if this instance of beverage is updated successfully do this 
    # if @beverage = Beverage.update_attributes(params.require(:beverage).permit(:bev_type, :price, :quantity, :roast, :brew, :expiration_date))
      # redirected back to beverages after edit is successful 
    #   redirect_to beverages_path
    # else
      # if the above is not successful rerender my "old beverage" (edit view)
#       render 'edit'
#     end
#   end

# end

# beverages controller inherits app controller
class BeveragesController < ApplicationController

  def index
    # loop through beverage class
    @beverages = Beverage.all
  end

  def new
    # make new and create at the same time
    # creates new beverage
    @beverage = Beverage.new
  end

  def create
      # params is a strong parameter control per controller action which actions can be changed 
    # binding this instance of beverage and setting it equal to the create method being performed on the beverage class and we are saying for this instance of beverage I am permitting the user to input these fields
    @beverage = Beverage.create(params.require(:beverage).permit(:bev_type, :price, :quantity, :roast, :brew, :expiration_date))
    # if the above process goes smoothly, save this instance of beverage and after you save it redirect to beverages_path - we got this from rake routes in the terminal and the prefix for #index
    if @beverage.save
      redirect_to beverages_path
    else
      # if the above is not successful rerender my "new form" (new view)
      render 'new'
    end
  end

  def edit
    # find an exsisting instance so you can edit it
    @beverage = Beverage.find(params[:id])
  end

  def update
    @beverage = Beverage.find(params[:id])
    if @beverage = Beverage.update_attributes(params.require(:beverage).permit(:bev_type, :price, :quantity, :roast, :brew, :expiration_date))
      redirect_to beverages_path
    else
      render 'edit'
    end
  end

  def show
    # finding particular beverage instance by it's id
    @beverage = Beverage.find(params[:id])
  end

  def destroy
    @beverage = Beverage.find(params[:id])
    # remove from database
    @beverage.destroy
    # redirect to list of beverages 
    redirect_to beverages_path
  end

end


