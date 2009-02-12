require 'date'

class CaldatesController < ApplicationController
  # GET /caldates
  # GET /caldates.xml
   before_filter :login_required
  def index
    @today=Date.today
    @caldates = Caldate.find(:all, :limit => 10)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @caldates }
    end
  end

  # GET /caldates/1
  # GET /caldates/1.xml
  def show
    @caldate = Caldate.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @caldate }
    end
  end

  # GET /caldates/new
  # GET /caldates/new.xml
  def new
    @caldate = Caldate.new
    @contacts= Contact.find(:all)
    @datearts=Dateart.find(:all)
    @dateprios=Dateprio.find(:all)
    @datestatuses=Datestatus.find(:all)

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @caldate }
    end
  end

  # GET /caldates/1/edit
  def edit
    @contacts= Contact.find(:all)
    @datearts=Dateart.find(:all)
    @dateprios=Dateprio.find(:all)
    @datestatuses=Datestatus.find(:all)
    @caldate = Caldate.find(params[:id])
  end

  # POST /caldates
  # POST /caldates.xml
  def create
    @caldate = Caldate.new(params[:caldate])

    respond_to do |format|
      if @caldate.save
        flash[:notice] = 'Caldate was successfully created.'
        format.html { redirect_to(@caldate) }
        format.xml  { render :xml => @caldate, :status => :created, :location => @caldate }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @caldate.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /caldates/1
  # PUT /caldates/1.xml
  def update
    @caldate = Caldate.find(params[:id])

    respond_to do |format|
      if @caldate.update_attributes(params[:caldate])
        flash[:notice] = 'Caldate was successfully updated.'
        format.html { redirect_to(@caldate) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @caldate.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /caldates/1
  # DELETE /caldates/1.xml
  def destroy
    @caldate = Caldate.find(params[:id])
    @caldate.destroy

    respond_to do |format|
      format.html { redirect_to(caldates_url) }
      format.xml  { head :ok }
    end
  end

 def search
    @today=Date.today
    @caldates = Caldate.search params[:name]
    respond_to do |format|
      format.html { render :template =>"caldates/index"}
      format.xml  { render :xml => @caldates }
    end
  end

 def filterdate
   @today = params[:today]
   @today=@today.to_date
   @date=params[:date]
   @date=@date.to_date
   @caldates = Caldate.find(:all, :conditions =>["startdate> ? and startdate< ?",@date,@date+1])
   respond_to do |format|
      format.html { render :template =>"caldates/index"}
      format.xml  { render :xml => @caldates }
    end
 end

   def datechange
   @today = params[:today]
   @today=@today.to_date
   @caldates = Caldate.find(:all, :limit => 20)

   respond_to do |format|
      format.html { render :template =>"caldates/index"}
      format.xml  { render :xml => @caldates }
    end
  end
end
