class Api::BaseController < ApplicationController
  def authenticate_user
    head status: :unauthorized and return unless User.find_by_token(request.headers['X-USER-TOKEN'])
  end
end
