class PetHotelsController < ApplicationController
  before_action :set_pet_hotel, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_user, only: [:create, :destroy]

  # GET /pet_hotels
  # GET /pet_hotels.json
  def index
    @pet_hotel = PetHotel.all
  end

  # GET /pet_hotels/1
  # GET /pet_hotels/1.json
  def show
  end

  # GET /pet_hotels/new
  def new
    @pet_hotel = PetHotel.new
  end

  # GET /pet_hotels/1/edit
  def edit
  end

  # POST /pet_hotels
  # POST /pet_hotels.json
  def create

    @pet_hotel = current_user.pet_hotels.build(pet_hotel_params)

    respond_to do |format|
      if @pet_hotel.save
        format.html { redirect_to @pet_hotel, notice: 'Pet hotel was successfully created.' }
        format.json { render :show, status: :created, location: @pet_hotel }
      else
        format.html { render :new }
        format.json { render json: @pet_hotel.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pet_hotels/1
  # PATCH/PUT /pet_hotels/1.json
  def update
    respond_to do |format|
      if @pet_hotel.update(pet_hotel_params)
        format.html { redirect_to @pet_hotel, notice: 'Pet hotel was successfully updated.' }
        format.json { render :show, status: :ok, location: @pet_hotel }
      else
        format.html { render :edit }
        format.json { render json: @pet_hotel.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pet_hotels/1
  # DELETE /pet_hotels/1.json
  def destroy
    @pet_hotel.destroy
    respond_to do |format|
      format.html { redirect_to pet_hotels_url, notice: 'Pet hotel was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pet_hotel
      @pet_hotel = PetHotel.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pet_hotel_params
      params.require(:pet_hotel).permit(:title, :description, :image_url, :phone, :website, :city)
    end
end
