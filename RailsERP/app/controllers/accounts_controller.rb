# Class to Create and Manage User Accounts
class AccountsController < ApplicationController
  # Be sure to include AuthenticationSystem in Application Controller instead
  include AuthenticatedSystem
  

  # Render the new User Template
  def new
  end

  # Create and Save User Account
  def create
    cookies.delete :auth_token
    # protects against session fixation attacks, wreaks havoc with 
    # request forgery protection.
    # uncomment at your own risk
    # reset_session
    @account = Account.new(params[:account])
    @account.save
    if @account.errors.empty?
      self.current_account = @account
      redirect_back_or_default('/')
      flash[:notice] = "Thanks for signing up!"
    else
      render :action => 'new'
    end
  end

end
