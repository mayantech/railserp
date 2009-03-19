# Controller Class for Startpage
class DashboardsController < ApplicationController
before_filter :login_required, :except => [ :index ]
  #render the Startpage
  def index
    @dashblogs = Dashblog.find(:all, :conditions => {:published => true} )
  end
end
