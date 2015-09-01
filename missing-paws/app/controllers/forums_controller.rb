class ForumsController < ApplicationController
  before_action :logged_in_user, only: [:new, :edit, :update, :destroy]
  before_action :set_forum, only: [:show, :edit, :update, :destroy]
  before_filter :disable_aside
  before_filter :set_cache_buster

  # GET /forums
  # GET /forums.json
  def index
    @forums = Forum.all.order('created_at DESC')     
  end

  # GET /forums/1
  # GET /forums/1.json
  def show 
    @forum = Forum.find(params[:id])
    @forum.views += 1
    @forum.save 
  end

  # GET /forums/new
  def new
    @forum = Forum.new
  end

  # GET /forums/1/edit
  def edit
  end

  # POST /forums
  # POST /forums.json
  def create
    @forum = current_user.forums.build(forum_params)
    @forum.views = 0

    respond_to do |format|
      if @forum.save
        format.html { redirect_to @forum, notice: I18n.t('.forum-created') || 'Forum was successfully created.' }
        format.json { render :show, status: :created, location: @forum }
      else
        format.html { render :new }
        format.json { render json: @forum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /forums/1
  # PATCH/PUT /forums/1.json
  def update
    respond_to do |format|
      if @forum.update(forum_params)
        format.html { redirect_to @forum, notice: I18n.t('.forum-updated') || 'Forum was successfully updated.' }
        format.json { render :show, status: :ok, location: @forum }
      else
        format.html { render :edit }
        format.json { render json: @forum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /forums/1
  # DELETE /forums/1.json
  def destroy
    @forum.destroy
    respond_to do |format|
      format.html { redirect_to forums_url, notice: I18n.t('.forum-deleted') || 'Forum was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_forum
      @forum = Forum.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def forum_params
      params.require(:forum).permit(:title, :content, :user_id, :view)
    end

    def disable_aside
      @disable_aside = true 
    end  

    def set_cache_buster
      response.headers["Cache-Control"] = "no-cache, no-store, max-age=0, must-revalidate"
      response.headers["Pragma"] = "no-cache"
      response.headers["Expires"] = "Fri, 01 Jan 1990 00:00:00 GMT"
    end
end
