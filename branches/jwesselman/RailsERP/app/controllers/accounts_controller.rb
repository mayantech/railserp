# Class to Create and Manage User Accounts
class AccountsController < ApplicationController
  # Be sure to include AuthenticationSystem in Application Controller instead
  include AuthenticatedSystem
  before_filter :login_required
  before_filter :has_permission?
  def index
    @accounts = Account.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @accounts }
    end
  end

  # Render the new User Template
  def new
    @roles = Role.find(:all)
    @account = Account.new
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

  def destroy
    @account = Account.find(params[:id])
    @account.destroy

    respond_to do |format|
      format.html { redirect_to(accounts_url) }
      format.xml  { head :ok }
    end
  end

  def live_search
    @phrase = params[:searchtext]
    @results = Account.search @phrase

    @number_match = @results.length

    render(:layout => false)
  end
end
