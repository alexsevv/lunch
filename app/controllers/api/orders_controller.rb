class Api::OrdersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    orders = Order.all
    render json: orders.to_json( include: [{ user: { only: [:name, :email] }},
                                           { soup: { only: [:name, :price] }},
                                           { cereal: { only: [:name, :price] }},
                                           { drink: { only: [:name, :price] }}
                                          ], only: [:id, :created_at])
  end
end
