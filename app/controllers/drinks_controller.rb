class DrinksController < ApplicationController
  before_action :set_drink, only: [:edit, :update]

  # GET /drinks
  def index
    @drinks = Drink.all
  end

  # GET /drinks/new
  def new
    @drink = Drink.new
  end

  # GET /drinks/1/edit
  def edit
  end

  # POST /drinks
  def create
    @drink = Drink.new(drink_params)

    if @drink.save
      redirect_to drinks_url, notice: I18n.t('controllers.drinks.created')
    else
      render :new
    end
  end

  # PATCH/PUT /drinks/1
  def update
    if @drink.update(drink_params)
      redirect_to drinks_url, notice: I18n.t('controllers.drinks.updated')
    else
      render :edit
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_drink
      @drink = Drink.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def drink_params
      params.require(:drink).permit(:name, :price, :photo)
    end
end
