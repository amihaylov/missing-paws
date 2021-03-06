class ApplicationController < ActionController::Base

  #Locale settings

  before_action :set_i18n_locale_from_params

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper

  protected
    def set_i18n_locale_from_params

      if params[:locale]
        if I18n.available_locales.map(&:to_s).include?(params[:locale])
        I18n.locale = params[:locale]
        else
          flash.now[:notice] = "#{params[:locale]} translation not available"
          logger.error flash.now[:notice]
        end
      end
    end


    def default_url_options
      { locale: I18n.locale }
    end

  private

    # Confirms a logged-in user.
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = I18n.t('.please-log') || "Please log in."
        redirect_to login_url
      end
    end  
end
