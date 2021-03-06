class PetShopsController < ApplicationController
  before_action :set_pet_shop, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_user, only: [:create, :destroy]
  

  # GET /pet_shops
  # GET /pet_shops.json
  def index
    if params[:search]
      @pet_shops = PetShop.search(params[:search]).order("created_at DESC")
    else
      @pet_shops = PetShop.all.order('created_at DESC')
    end 
  end

  # GET /pet_shops/1
  # GET /pet_shops/1.json
  def show
  end

  # GET /pet_shops/new
  def new
    @pet_shop = PetShop.new
  end

  # GET /pet_shops/1/edit
  def edit
  end

  # POST /pet_shops
  # POST /pet_shops.json
  def create

   @pet_shop = current_user.pet_shops.build(pet_shop_params)

    respond_to do |format|
      if @pet_shop.save
        format.html { redirect_to @pet_shop, notice: I18n.t('.shop-created') || 'Pet shop was successfully created.' }
        format.json { render :show, status: :created, location: @pet_shop }
      else
        format.html { render :new }
        format.json { render json: @pet_shop.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pet_shops/1
  # PATCH/PUT /pet_shops/1.json
  def update
    respond_to do |format|
      if @pet_shop.update(pet_shop_params)
        format.html { redirect_to @pet_shop, notice: I18n.t('.shop-updated') || 'Pet shop was successfully updated.' }
        format.json { render :show, status: :ok, location: @pet_shop }
      else
        format.html { render :edit }
        format.json { render json: @pet_shop.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pet_shops/1
  # DELETE /pet_shops/1.json
  def destroy
    @pet_shop.destroy
    respond_to do |format|
      format.html { redirect_to pet_shops_url, notice: I18n.t('.shop-deleted') || 'Pet shop was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pet_shop
      @pet_shop = PetShop.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pet_shop_params
      params.require(:pet_shop).permit(:title, :description, :image_url, :phone, :website, :city)
    end
end
