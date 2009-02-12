class DatetasksController < ApplicationController
   before_filter :login_required
  # GET /datetasks
  # GET /datetasks.xml
  def index
    @datetasks = Datetask.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @datetasks }
    end
  end

  # GET /datetasks/1
  # GET /datetasks/1.xml
  def show
    @datetask = Datetask.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @datetask }
    end
  end

  # GET /datetasks/new
  # GET /datetasks/new.xml
  def new
    @datetask = Datetask.new
    @dateprios=Dateprio.find(:all)
    @datestatuses=Datestatus.find(:all)
    @caldates=Caldate.find(:all)
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @datetask }
    end
  end

  # GET /datetasks/1/edit
  def edit
    @datetask = Datetask.find(params[:id])
    @dateprios=Dateprio.find(:all)
    @datestatuses=Datestatus.find(:all)
    @caldates=Caldate.find(:all)
  end

  # POST /datetasks
  # POST /datetasks.xml
  def create
    @datetask = Datetask.new(params[:datetask])

    respond_to do |format|
      if @datetask.save
        flash[:notice] = 'Datetask was successfully created.'
        format.html { redirect_to(@datetask) }
        format.xml  { render :xml => @datetask, :status => :created, :location => @datetask }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @datetask.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /datetasks/1
  # PUT /datetasks/1.xml
  def update
    @datetask = Datetask.find(params[:id])

    respond_to do |format|
      if @datetask.update_attributes(params[:datetask])
        flash[:notice] = 'Datetask was successfully updated.'
        format.html { redirect_to(@datetask) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @datetask.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /datetasks/1
  # DELETE /datetasks/1.xml
  def destroy
    @datetask = Datetask.find(params[:id])
    @datetask.destroy

    respond_to do |format|
      format.html { redirect_to(datetasks_url) }
      format.xml  { head :ok }
    end
  end

 def search
    @datetasks = Datetask.search params[:name]
    respond_to do |format|
      format.html { render :template =>"datetasks/index"}
      format.xml  { render :xml => @datetasks }
    end
  end
end
