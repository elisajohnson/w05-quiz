class PastriesController < ApplicationController
  before_action :set_pastry, only: [:show, :edit, :update, :destroy]

  # GET /pastries
  # GET /pastries.json
  # eg: instagram when you see all of your photos
  def index
    @pastries = Pastry.all
  end

  # GET /pastries/1
  # GET /pastries/1.json
  # eg: instagram when you click on a single photo
  def show
  end

  # GET /pastries/new
  # create a new instance of a pastry class 
  # new view would probably take form data
  def new
    @pastry = Pastry.new
  end

  # GET /pastries/1/edit
  # edit content
  def edit
  end

  # POST /pastries
  # POST /pastries.json
  # create instance in the database. create doesn't get it's own view 
  # take what was in the 'new' form and passing it to database
  def create
    @pastry = Pastry.new(pastry_params)

    respond_to do |format|
      if @pastry.save
        format.html { redirect_to @pastry, notice: 'Pastry was successfully created.' }
        format.json { render :show, status: :created, location: @pastry }
      else
        format.html { render :new }
        format.json { render json: @pastry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pastries/1
  # PATCH/PUT /pastries/1.json
  # doesn't get it's own view
  # change what's in the database from the user edit of form
  def update
    respond_to do |format|
      if @pastry.update(pastry_params)
        format.html { redirect_to @pastry, notice: 'Pastry was successfully updated.' }
        format.json { render :show, status: :ok, location: @pastry }
      else
        format.html { render :edit }
        format.json { render json: @pastry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pastries/1
  # DELETE /pastries/1.json
  # deletes that instance from the database
  def destroy
    @pastry.destroy
    respond_to do |format|
      format.html { redirect_to pastries_url, notice: 'Pastry was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    # protect controller actions from outsiders from manipulating it
    def set_pastry
      @pastry = Pastry.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pastry_params
      params.require(:pastry).permit(:name, :price, :quantity)
    end
end
