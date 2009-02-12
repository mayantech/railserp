class DatestatusesController < ApplicationController
  # GET /datestatuses
  # GET /datestatuses.xml
   before_filter :login_required
  def index
    @datestatuses = Datestatus.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @datestatuses }
    end
  end

  # GET /datestatuses/1
  # GET /datestatuses/1.xml
  def show
    @datestatus = Datestatus.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @datestatus }
    end
  end

  # GET /datestatuses/new
  # GET /datestatuses/new.xml
  def new
    @datestatus = Datestatus.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @datestatus }
    end
  end

  # GET /datestatuses/1/edit
  def edit
    @datestatus = Datestatus.find(params[:id])
  end

  # POST /datestatuses
  # POST /datestatuses.xml
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
  def destroy
    @datestatus = Datestatus.find(params[:id])
    @datestatus.destroy

    respond_to do |format|
      format.html { redirect_to(datestatuses_url) }
      format.xml  { head :ok }
    end
  end

  def search
    @datestatuses = Datestatus.search params[:name]
    respond_to do |format|
      format.html { render :template =>"datestatuses/index"}
      format.xml  { render :xml => @datestatuses }
    end
  end
end
