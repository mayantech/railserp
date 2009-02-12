class DatepriosController < ApplicationController
  # GET /dateprios
  # GET /dateprios.xml
   before_filter :login_required
  def index
    @dateprios = Dateprio.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @dateprios }
    end
  end

  # GET /dateprios/1
  # GET /dateprios/1.xml
  def show
    @dateprio = Dateprio.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @dateprio }
    end
  end

  # GET /dateprios/new
  # GET /dateprios/new.xml
  def new
    @dateprio = Dateprio.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @dateprio }
    end
  end

  # GET /dateprios/1/edit
  def edit
    @dateprio = Dateprio.find(params[:id])
  end

  # POST /dateprios
  # POST /dateprios.xml
  def create
    @dateprio = Dateprio.new(params[:dateprio])

    respond_to do |format|
      if @dateprio.save
        flash[:notice] = 'Dateprio was successfully created.'
        format.html { redirect_to(@dateprio) }
        format.xml  { render :xml => @dateprio, :status => :created, :location => @dateprio }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @dateprio.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /dateprios/1
  # PUT /dateprios/1.xml
  def update
    @dateprio = Dateprio.find(params[:id])

    respond_to do |format|
      if @dateprio.update_attributes(params[:dateprio])
        flash[:notice] = 'Dateprio was successfully updated.'
        format.html { redirect_to(@dateprio) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @dateprio.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /dateprios/1
  # DELETE /dateprios/1.xml
  def destroy
    @dateprio = Dateprio.find(params[:id])
    @dateprio.destroy

    respond_to do |format|
      format.html { redirect_to(dateprios_url) }
      format.xml  { head :ok }
    end
  end

  def search
    @dateprios = Dateprio.search params[:name]
    respond_to do |format|
      format.html { render :template =>"dateprios/index"}
      format.xml  { render :xml => @dateprios }
    end
  end
end
