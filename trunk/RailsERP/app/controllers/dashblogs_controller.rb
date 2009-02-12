class DashblogsController < ApplicationController
  # GET /dashblogs
  # GET /dashblogs.xml
 before_filter :login_required
  def index
    @dashblogs = Dashblog.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @dashblogs }
    end
  end

  # GET /dashblogs/1
  # GET /dashblogs/1.xml
  def show
    @dashblog = Dashblog.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @dashblog }
    end
  end

  # GET /dashblogs/new
  # GET /dashblogs/new.xml
  def new
    @dashblog = Dashblog.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @dashblog }
    end
  end

  # GET /dashblogs/1/edit
  def edit
    @dashblog = Dashblog.find(params[:id])
  end

  # POST /dashblogs
  # POST /dashblogs.xml
  def create
    @dashblog = Dashblog.new(params[:dashblog])

    respond_to do |format|
      if @dashblog.save
        flash[:notice] = 'Dashblog was successfully created.'
        format.html { redirect_to(@dashblog) }
        format.xml  { render :xml => @dashblog, :status => :created, :location => @dashblog }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @dashblog.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /dashblogs/1
  # PUT /dashblogs/1.xml
  def update
    @dashblog = Dashblog.find(params[:id])

    respond_to do |format|
      if @dashblog.update_attributes(params[:dashblog])
        flash[:notice] = 'Dashblog was successfully updated.'
        format.html { redirect_to(@dashblog) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @dashblog.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /dashblogs/1
  # DELETE /dashblogs/1.xml
  def destroy
    @dashblog = Dashblog.find(params[:id])
    @dashblog.destroy

    respond_to do |format|
      format.html { redirect_to(dashblogs_url) }
      format.xml  { head :ok }
    end
  end

    def search
    @dashblogs = Dashblog.search params[:name]
    respond_to do |format|
      format.html { render :template =>"dashblogs/index"}
      format.xml  { render :xml => @dashblogs }
    end
  end
end
