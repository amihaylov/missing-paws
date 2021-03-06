class FoundAnimalsController < ApplicationController
  before_action :logged_in_user, only: [:new, :show, :edit, :update, :destroy]
  before_action :set_found_animal, only: [:show, :edit, :update, :destroy]

  # GET /found_animals
  # GET /found_animals.json
  def index
    if params[:search]
      @found_animals = FoundAnimal.search(params[:search]).order("created_at DESC").paginate(page: params[:page], per_page: 10)
    else
      @found_animals = FoundAnimal.all.order('created_at DESC').paginate(page: params[:page], per_page: 10)
    end   
  end

  # GET /found_animals/1
  # GET /found_animals/1.json
  def show
  end

  # GET /found_animals/new
  def new
    @found_animal = FoundAnimal.new
  end

  # GET /found_animals/1/edit
  def edit
  end

  # POST /found_animals
  # POST /found_animals.json
  def create
    @found_animal = current_user.found_animals.build(found_animal_params)

    respond_to do |format|
      if @found_animal.save
        format.html { redirect_to @found_animal, notice: I18n.t('.found-created') || 'Found animal was successfully created.' }
        format.json { render :show, status: :created, location: @found_animal }
      else
        format.html { render :new }
        format.json { render json: @found_animal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /found_animals/1
  # PATCH/PUT /found_animals/1.json
  def update
    respond_to do |format|
      if @found_animal.update(found_animal_params)
        format.html { redirect_to @found_animal, notice: I18n.t('.found-updated') || 'Found animal was successfully updated.' }
        format.json { render :show, status: :ok, location: @found_animal }
      else
        format.html { render :edit }
        format.json { render json: @found_animal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /found_animals/1
  # DELETE /found_animals/1.json
  def destroy
    @found_animal.destroy
    respond_to do |format|
      format.html { redirect_to found_animals_url, notice: I18n.t('.found-deleted') || 'Found animal was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_found_animal
      @found_animal = FoundAnimal.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def found_animal_params
      params.require(:found_animal).permit(:title, :description, :image, :name, :phone, :email, :city)
    end
end
