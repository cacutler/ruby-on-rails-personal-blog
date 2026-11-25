class ApplicationController < ActionController::Base
  helper_method :current_user

  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  private

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def require_authentication
    return if current_user

    respond_to do |format|
      format.html { redirect_to sign_in_path, alert: "Please sign in to continue." }
      format.json { render json: { error: "Authentication required" }, status: :unauthorized }
    end
  end
end
