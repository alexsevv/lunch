class CerealsController < ApplicationController
  before_action :set_cereal, only: [:edit, :update]

  # GET /cereals
  def index
    @cereals = Cereal.all
  end

  # GET /cereals/new
  def new
    @cereal = Cereal.new
  end

  # GET /cereals/1/edit
  def edit
  end

  # POST /cereals
  def create
    @cereal = Cereal.new(cereal_params)

    if @cereal.save
      redirect_to cereals_url, notice: I18n.t('controllers.cereals.created')
    else
      render :new
    end
  end

  # PATCH/PUT /cereals/1
  def update
    if @cereal.update(cereal_params)
      redirect_to @cereal, notice: I18n.t('controllers.cereals.updated')
    else
      render :edit
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cereal
      @cereal = Cereal.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cereal_params
      params.require(:cereal).permit(:name, :price, :photo)
    end
end
