# Controller Class for Date Status
class DatestatusesController < ApplicationController
  # GET /datestatuses
  # GET /datestatuses.xml
   before_filter :login_required
   before_filter :has_permission?
  # List all Date Statuses
  def index
    @datestatuses = Datestatus.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @datestatuses }
    end
  end

  # GET /datestatuses/1
  # GET /datestatuses/1.xml
  # Show a Date Status
  def show
    @datestatus = Datestatus.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @datestatus }
    end
  end

  # GET /datestatuses/new
  # GET /datestatuses/new.xml
  # Create a new Date Status
  def new
    @datestatus = Datestatus.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @datestatus }
    end
  end

  # GET /datestatuses/1/edit
  # Edit a Date Status
  def edit
    @datestatus = Datestatus.find(params[:id])
  end

  # POST /datestatuses
  # POST /datestatuses.xml
  # Save a Date Status
  def create
    @datestatus = Datestatus.new(params[:datestatus])

    respond_to do |format|
      if @datestatus.save
        flash[:notice] = 'Datestatus was successfully created.'
        format.html { redirect_to(@datestatus) }
        format.xml  { render :xml => @datestatus, :status => :created, :location => @datestatus }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @datestatus.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /datestatuses/1
  # PUT /datestatuses/1.xml
  # Update a Date Status
  def update
    @datestatus = Datestatus.find(params[:id])

    respond_to do |format|
      if @datestatus.update_attributes(params[:datestatus])
        flash[:notice] = 'Datestatus was successfully updated.'
        format.html { redirect_to(@datestatus) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @datestatus.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /datestatuses/1
  # DELETE /datestatuses/1.xml
  # Delete a Date Status
  def destroy
    @datestatus = Datestatus.find(params[:id])
    @datestatus.destroy

    respond_to do |format|
      format.html { redirect_to(datestatuses_url) }
      format.xml  { head :ok }
    end
  end

  # Search for a Date Status
  def search
    @datestatuses = Datestatus.search params[:name]
    respond_to do |format|
      format.html { render :template =>"datestatuses/index"}
      format.xml  { render :xml => @datestatuses }
    end
  end

  # Search for a Date Status with a srting AJAX Search
  def live_search
    @phrase = params[:searchtext]
    @results = Datestatus.search @phrase

    @number_match = @results.length

    render(:layout => false)
  end
end
