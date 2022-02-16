class TerrainsController < ApplicationController
skip_before_action :authenticate_user!, only: [ :index, :show ]
  before_action :set_terrain, only: [:show, :edit, :update, :destroy]

  # GET /terrains
  #def index
    #@terrains = Terrain.all
  #end

  def index
         if params[:query].present?

         @terrains = Terrain.where("lower(title)  LIKE ?", "%" + params[:query].downcase + "%")
         #@terrains = Terrain.where("lower(description)  LIKE ?", "%" + params[:query].downcase + "%")
         #@terrains = Terrain.where("lower(value)  LIKE ?", "%" + params[:query].downcase + "%")
        else

         @terrains = Terrain.order(created_at: :desc)
        end
      end

  # GET /terrains/1
  def show
  end

  # GET /terrains/new
  def new
    @terrain = Terrain.new
  end

  # GET /terrains/1/edit
  def edit
  end

  # POST /terrains
  def create
    @terrain = Terrain.new(terrain_params)
    @terrain.user = current_user
    if @terrain.save
      redirect_to @terrain, notice: 'Terrain was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /terrains/1
  def update
    if @terrain.update(terrain_params)
      redirect_to @terrain, notice: 'Terrain was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /terrains/1
  def destroy
    @terrain.destroy
    redirect_to terrains_url, notice: 'Terrain was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_terrain
      @terrain = Terrain.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def terrain_params
      params.require(:terrain).permit(:title, :description, :value)
    end
end
