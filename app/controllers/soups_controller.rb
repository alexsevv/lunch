class SoupsController < ApplicationController
  before_action :set_soup, only: [:edit, :update]

  # GET /soups
  def index
    @soups = Soup.all
  end

  # GET /soups/new
  def new
    @soup = Soup.new
  end

  # GET /soups/1/edit
  def edit
  end

  # POST /soups
  def create
    @soup = Soup.new(soup_params)

    if @soup.save
      redirect_to soups_url, notice: I18n.t('controllers.soups.created')
    else
      render :new
    end
  end

  # PATCH/PUT /soups/1
  def update
    if @soup.update(soup_params)
      redirect_to soups_url, notice: I18n.t('controllers.soups.updated')
    else
      render :edit
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_soup
      @soup = Soup.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def soup_params
      params.require(:soup).permit(:name, :price, :photo)
    end
end
