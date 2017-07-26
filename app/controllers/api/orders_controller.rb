class Api::OrdersController < ApplicationController
  before_action :authenticate_user

  def index
    orders = Order.all
    render json: orders.to_json( include: [{ user: { only: [:name, :email] }},
                                           { soup: { only: [:name, :price] }},
                                           { cereal: { only: [:name, :price] }},
                                           { drink: { only: [:name, :price] }}
                                          ], only: [:id, :created_at])
  end

  private
    def authenticate_user
      user_token = request.headers['X-USER-TOKEN']
      if user_token
        @user = User.find_by_token(user_token)
        #Unauthorize if a user object is not returned
        if @user.nil?
          return unauthorize
        end
      else
        return unauthorize
      end
    end

    def unauthorize
      head status: :unauthorized
      return false
    end
end

# получить инфу можно запросом:
# curl -X GET -H "X-USER-TOKEN: 999999999999999" -H "Content-Type: application/json" "http://sait.com/api/orders"
#999999999999999 - токен юзера с БД
