class DashboardsController < ApplicationController
before_filter :login_required, :except => [ :index ]
  def index
    @dashblogs = Dashblog.find(:all, :conditions => {:published => true} )
  end
end
