class ApplicationController < ActionController::API
  before_action :authenticate_user!, only: [:auth_ping]

  def ping
    render plain: 'pong'
  end

  def auth_ping
    render plain: 'pong'
  end

  def me
    render json: current_user.present? ? {data: current_user}.to_json : {data: "Access Denied"} 
  end

  def render_resource(resource)
    if resource.errors.empty?
      render json: resource
    else
      validation_error(resource)
    end
  end

  def validation_error(resource)
    render json: {
      errors: [
        {
          status: '400',
          title: 'Bad Request',
          detail: resource.errors,
          code: '100'
        }
      ]
    }, status: :bad_request
  end
end
