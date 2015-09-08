class PetAcademiesController < ApplicationController
  before_action :set_pet_academy, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_user, only: [:create, :destroy]

  # GET /pet_academies
  # GET /pet_academies.json
  def index
    if params[:search]
      @pet_academies = PetAcademy.search(params[:search]).order("created_at DESC")
    else
      @pet_academies = PetAcademy.all.order('created_at DESC')
    end 
  end

  # GET /pet_academies/1
  # GET /pet_academies/1.json
  def show
  end

  # GET /pet_academies/new
  def new
    @pet_academy = PetAcademy.new
  end

  # GET /pet_academies/1/edit
  def edit
  end

  # POST /pet_academies
  # POST /pet_academies.json
  def create

     @pet_academy = current_user.pet_academies.build(pet_academy_params)


    respond_to do |format|
      if @pet_academy.save
        format.html { redirect_to @pet_academy, notice: I18n.t('.academy-created') || 'Pet academy was successfully created.' }
        format.json { render :show, status: :created, location: @pet_academy }
      else
        format.html { render :new }
        format.json { render json: @pet_academy.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pet_academies/1
  # PATCH/PUT /pet_academies/1.json
  def update
    respond_to do |format|
      if @pet_academy.update(pet_academy_params)
        format.html { redirect_to @pet_academy, notice: I18n.t('.academy-updated') || 'Pet academy was successfully updated.' }
        format.json { render :show, status: :ok, location: @pet_academy }
      else
        format.html { render :edit }
        format.json { render json: @pet_academy.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pet_academies/1
  # DELETE /pet_academies/1.json
  def destroy
    @pet_academy.destroy
    respond_to do |format|
      format.html { redirect_to pet_academies_url, notice: I18n.t('.academy-deleted') || 'Pet academy was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pet_academy
      @pet_academy = PetAcademy.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pet_academy_params
      params.require(:pet_academy).permit(:title, :description, :image_url, :phone, :website, :city)
    end
end
