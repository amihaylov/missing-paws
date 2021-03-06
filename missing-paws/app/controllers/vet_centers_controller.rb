class VetCentersController < ApplicationController
  before_action :set_vet_center, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_user, only: [:create, :destroy]
  
  # GET /vet_centers
  # GET /vet_centers.json
  def index
    if params[:search]
      @vet_centers = VetCenter.search(params[:search]).order("created_at DESC")
    else
      @vet_centers = VetCenter.all.order('created_at DESC')
    end 
  end

  # GET /vet_centers/1
  # GET /vet_centers/1.json
  def show
  end

  # GET /vet_centers/new
  def new
    @vet_center = VetCenter.new
  end

  # GET /vet_centers/1/edit
  def edit
  end

  # POST /vet_centers
  # POST /vet_centers.json
  def create
    # @vet_center = VetCenter.new(vet_center_params)
      

      @vet_center = current_user.vet_centers.build(vet_center_params)


    respond_to do |format|
      if @vet_center.save
        format.html { redirect_to @vet_center, notice: I18n.t('.center-created') || 'Vet center was successfully created.' }
        format.json { render :show, status: :created, location: @vet_center }
      else
        format.html { render :new }
        format.json { render json: @vet_center.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vet_centers/1
  # PATCH/PUT /vet_centers/1.json
  def update
    respond_to do |format|
      if @vet_center.update(vet_center_params)
        format.html { redirect_to @vet_center, notice: I18n.t('.center-updated') || 'Vet center was successfully updated.' }
        format.json { render :show, status: :ok, location: @vet_center }
      else
        format.html { render :edit }
        format.json { render json: @vet_center.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vet_centers/1
  # DELETE /vet_centers/1.json
  def destroy
    @vet_center.destroy
    respond_to do |format|
      format.html { redirect_to vet_centers_url, notice: I18n.t('.center-deleted') || 'Vet center was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vet_center
      @vet_center = VetCenter.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vet_center_params
      params.require(:vet_center).permit(:title, :description, :image, :phone, :website, :city)
    end
end


      #   def vet_center_params
      #     params.require(:vet_center).permit(:title, :description, :image_url, :name, :phone, :email, :city)
      # end

      

    
