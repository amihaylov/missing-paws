class AdoptionsController < ApplicationController
  before_action :logged_in_user, only: [:show, :edit, :update, :destroy]
  before_action :set_adoption, only: [:show, :edit, :update, :destroy]

  # GET /adoptions
  # GET /adoptions.json
  def index
    if params[:search]
      @adoptions = Adoption.search(params[:search]).order("created_at DESC")
    else
      @adoptions = Adoption.all.order('created_at DESC')
    end   
  end

  # GET /adoptions/1
  # GET /adoptions/1.json
  def show
  end

  # GET /adoptions/new
  def new
    @adoption = Adoption.new
  end

  # GET /adoptions/1/edit
  def edit
  end

  # POST /adoptions
  # POST /adoptions.json
  def create
    #@adoption = Adoption.new(adoption_params)
    @adoption = current_user.adoptions.build(adoption_params)

    respond_to do |format|
      if @adoption.save
        format.html { redirect_to @adoption, notice: 'Adoption article was successfully created.' }
        format.json { render :show, status: :created, location: @adoption }
      else
        format.html { render :new }
        format.json { render json: @adoption.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /adoptions/1
  # PATCH/PUT /adoptions/1.json
  def update
    respond_to do |format|
      if @adoption.update(adoption_params)
        format.html { redirect_to @adoption, notice: 'Adoption article was successfully updated.' }
        format.json { render :show, status: :ok, location: @adoption }
      else
        format.html { render :edit }
        format.json { render json: @adoption.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /adoptions/1
  # DELETE /adoptions/1.json
  def destroy
    @adoption.destroy
    respond_to do |format|
      format.html { redirect_to adoptions_url, notice: 'Adoption article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_adoption
      @adoption = Adoption.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def adoption_params
      params.require(:adoption).permit(:title, :description, :image_url, :name, :phone, :email, :city)
    end

    def correct_user
          @lost_animal = current_user.lost_animals.find_by(id: params[:id])
          redirect_to root_url if @lost_animal.nil?
    end
end
