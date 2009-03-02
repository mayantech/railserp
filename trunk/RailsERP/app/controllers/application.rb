# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.


class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  include  AuthenticatedSystem
  include FaceboxRender
  session :session_key => '_railserp_globalite_session_id'
  before_filter :set_locale
  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => '2e8cf15e111afc0a88cf55169b1084f0'
  
  private
  
  def set_locale
    default_locale = :de
    accepted_langs = [:de, :en, :tr]
    http_accept_language = request.env['HTTP_ACCEPT_LANGUAGE']
    browser_locale = http_accept_language[/[a-z]{1,2}/].to_sym
    @current_locale = params[:locale] || session[:locale] ||
    browser_locale || default_locale
    if !accepted_langs.include? @current_locale.to_sym
      @current_locale = default_locale
    end
    I18n.locale = @current_locale
    session[:locale] = @current_locale
  end

end
