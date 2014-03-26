class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  after_filter  :set_csrf_cookie_for_ng

  before_filter :update_sanitized_params, if: :devise_controller?

  def set_csrf_cookie_for_ng
    cookies['XSRF-TOKEN'] = form_authenticity_token if protect_against_forgery?
  end

  def render_with_protection(json_content, parameters = {})
    render parameters.merge(content_type: 'application/json', text: ")]}',\n" + json_content)
  end


  def update_sanitized_params
    devise_parameter_sanitizer.for(:sign_up) {|u| u.permit(:username, :f_name, :l_name, :email, :password, :password_confirmation)}
  end

  protected

    def verified_request?
      super || form_authenticity_token == request.headers['X-XSRF-TOKEN']
    end

  def index
  end
end
