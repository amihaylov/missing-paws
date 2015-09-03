class AnimalSheltersController < ApplicationController
  before_action :set_animal_shelter, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_user, only: [:create, :destroy]
  

  # GET /animal_shelters
  # GET /animal_shelters.json
  def index
    if params[:search]
      @animal_shelters = AnimalShelter.search(params[:search]).order("created_at DESC")
    else
      @animal_shelters = AnimalShelter.all.order('created_at DESC')
    end 
  end

  # GET /animal_shelters/1
  # GET /animal_shelters/1.json
  def show
  end

  # GET /animal_shelters/new
  def new
    @animal_shelter = AnimalShelter.new
  end

  # GET /animal_shelters/1/edit
  def edit
  end

  # POST /animal_shelters
  # POST /animal_shelters.json
  def create
    # @animal_shelter = AnimalShelter.new(animal_shelter_params)

    @vet_center = current_user.animal_shelters.build(animal_shelter_params)

    respond_to do |format|
      if @animal_shelter.save
        format.html { redirect_to @animal_shelter, notice: I18n.t('.shelter-created') || 'Animal shelter was successfully created.' }
        format.json { render :show, status: :created, location: @animal_shelter }
      else
        format.html { render :new }
        format.json { render json: @animal_shelter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /animal_shelters/1
  # PATCH/PUT /animal_shelters/1.json
  def update
    respond_to do |format|
      if @animal_shelter.update(animal_shelter_params)
        format.html { redirect_to @animal_shelter, notice: I18n.t('.shelter-updated') || 'Animal shelter was successfully updated.' }
        format.json { render :show, status: :ok, location: @animal_shelter }
      else
        format.html { render :edit }
        format.json { render json: @animal_shelter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /animal_shelters/1
  # DELETE /animal_shelters/1.json
  def destroy
    @animal_shelter.destroy
    respond_to do |format|
      format.html { redirect_to animal_shelters_url, notice: I18n.t('.shelter-deleted') || 'Animal shelter was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_animal_shelter
      @animal_shelter = AnimalShelter.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def animal_shelter_params
      params.require(:animal_shelter).permit(:title, :description, :image_url, :phone, :website, :city)
    end
end
