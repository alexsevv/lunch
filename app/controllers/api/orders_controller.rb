class Api::OrdersController < Api::BaseController
  before_action :authenticate_user

  def index
    orders = Order.all
    render json: orders.to_json( include: [{ user: { only: [:name, :email] }},
                                           { soup: { only: [:name, :price] }},
                                           { cereal: { only: [:name, :price] }},
                                           { drink: { only: [:name, :price] }}
                                          ], only: [:id, :created_at])
  end
end

# получить инфу можно запросом:
# curl -X GET -H "X-USER-TOKEN: 999999999999999" -H "Content-Type: application/json" "http://sait.com/api/orders"
#999999999999999 - токен юзера с БД
