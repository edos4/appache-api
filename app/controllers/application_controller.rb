class ApplicationController < ActionController::API
  before_action :authenticate_user!, only: [:auth_ping]
  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def ping
    render plain: 'pong'
  end

  def auth_ping
    render plain: 'pong'
  end

  def me
    details = current_user.present? ? {data: {
        id: current_user.id,
        email: current_user.email,
        created_at: current_user.created_at,
        updated_at: current_user.updated_at,
        role: (current_user.staff.role rescue nil)
    }}.to_json : {data: "Access Denied"}

    classes = [Studio]     

    permissions = { }                             

    classes.each do |clazz|                       
      policy =  Pundit.policy(current_user, clazz)      
      policy.public_methods(false).sort.each do |m|      
        result = policy.send m                    
        permissions["#{clazz}.#{m}"] = result     
      end
    end 

    render json: {details: details, permissions: permissions}
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

  private

  def user_not_authorized
    # flash[:alert] = "You are not authorized to perform this action."
    render json: {message: "Access Denied"}, :status => :forbidden
  end
end
