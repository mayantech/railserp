# Controller Class for News
class DashblogsController < ApplicationController
  # GET /dashblogs
  # GET /dashblogs.xml
 before_filter :login_required
 before_filter :has_permission?
  # List all News
  def index
    @dashblogs = Dashblog.find(:all, :limit => @@listlimit )
    @dashblogcount = Dashblog.count
    @offset = 0
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @dashblogs }
    end
  end

  # GET /dashblogs/1
  # GET /dashblogs/1.xml
  # Show a new News
  def show
    @dashblog = Dashblog.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @dashblog }
    end
  end

  # GET /dashblogs/new
  # GET /dashblogs/new.xml
  # Create a new News
  def new
    @dashblog = Dashblog.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @dashblog }
    end
  end

  # GET /dashblogs/1/edit
  # Edit a News Entry
  def edit
    @dashblog = Dashblog.find(params[:id])
  end

  # POST /dashblogs
  # POST /dashblogs.xml
  # Save a News Entry
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
  # Update a News
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
  # Delete a News
  def destroy
    @dashblog = Dashblog.find(params[:id])
    @dashblog.destroy

    respond_to do |format|
      format.html { redirect_to(dashblogs_url) }
      format.xml  { head :ok }
    end
  end

  # Search for a News with a String Fullindex
  def search
    @dashblogs = Dashblog.search params[:name]
    respond_to do |format|
      format.html { render :template =>"dashblogs/index"}
      format.xml  { render :xml => @dashblogs }
    end
  end

  # Search for a News with a srting AJAX Search
  def live_search
    @dashblogcount = Dashblog.count
    @phrase = params[:searchtext]
    if @phrase != "" then
    @results = Dashblog.search @phrase
    end
    @number_match = @results.length

    render(:layout => false)
  end

  # Get the next list from Offset to Limit
  def list_next
    @dashblogcount = Dashblog.count
    @offset = params[:offset]
    @offset = @offset.to_i
    @offset = @offset + @@listlimit
    if @offset >= @dashblogcount 
      @offset = @offset - @@listlimit
    end
    @dashblogs = Dashblog.find(:all, :offset => @offset ,:limit => @@listlimit )
    respond_to do |format|
      format.html { render :template =>"dashblogs/index"}
      format.xml  { render :xml => @dashblogs }
    end
  end

  # Get the previous list before the offset
  def list_previous
    @dashblogcount = Dashblog.count
    @offset = params[:offset]
    @offset = @offset.to_i
    if @offset != 0
      @offset = @offset - @@listlimit
      @dashblogs = Dashblog.find(:all, :offset => @offset ,:limit => @@listlimit )
      respond_to do |format|
        format.html { render :template =>"dashblogs/index"}
        format.xml  { render :xml => @dashblogs }
      end
    else
      @dashblogs = Dashblog.find(:all, :offset => @offset ,:limit => @@listlimit )
      respond_to do |format|
        format.html { render :template =>"dashblogs/index"}
        format.xml  { render :xml => @dashblogs }
      end
    end
  end
end
