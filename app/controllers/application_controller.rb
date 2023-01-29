class ApplicationController < ActionController::Base
  before_action :set_locale

  def set_locale
    session[:locale] = params[:l] if params[:l]
    I18n.locale = session[:locale] || I18n.default_locale
  end
end
