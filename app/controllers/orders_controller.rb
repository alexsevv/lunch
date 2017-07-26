class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update]

  # GET /orders
  def index
    @orders = Order.all
  end

  # GET /orders/1
  def show
  end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  def create
    @order = Order.new(order_params)
    @order.user = current_user

    if @order.save
      redirect_to root_url,  notice: I18n.t('controllers.orders.created')
    else
      redirect_to root_url, notice: I18n.t('controllers.orders.error')
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def order_params
      params.require(:order).permit(:soup_id, :cereal_id, :drink_id)
    end
end
