class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :set_locale
  
  def set_locale
    Rails.logger.info "test #{params[:language]}"
    I18n.locale = session[:language] 
  end
end


 
