class CompanyartsController < ApplicationController
  # GET /companyarts
  # GET /companyarts.xml
  before_filter :login_required
  def index
    @companyarts = Companyart.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @companyarts }
    end
  end

  # GET /companyarts/1
  # GET /companyarts/1.xml
  def show
    @companyart = Companyart.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @companyart }
    end
  end

  # GET /companyarts/new
  # GET /companyarts/new.xml
  def new
    @companyart = Companyart.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @companyart }
    end
  end

  # GET /companyarts/1/edit
  def edit
    @companyart = Companyart.find(params[:id])
  end

  # POST /companyarts
  # POST /companyarts.xml
  def create
    @companyart = Companyart.new(params[:companyart])

    respond_to do |format|
      if @companyart.save
        flash[:notice] = 'Companyart was successfully created.'
        format.html { redirect_to(@companyart) }
        format.xml  { render :xml => @companyart, :status => :created, :location => @companyart }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @companyart.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /companyarts/1
  # PUT /companyarts/1.xml
  def update
    @companyart = Companyart.find(params[:id])

    respond_to do |format|
      if @companyart.update_attributes(params[:companyart])
        flash[:notice] = 'Companyart was successfully updated.'
        format.html { redirect_to(@companyart) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @companyart.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /companyarts/1
  # DELETE /companyarts/1.xml
  def destroy
    @companyart = Companyart.find(params[:id])
    @companyart.destroy

    respond_to do |format|
      format.html { redirect_to(companyarts_url) }
      format.xml  { head :ok }
    end
  end
   def search
    @companyarts = Companyart.search params[:name]
    respond_to do |format|
      format.html { render :template =>"companyarts/index"}
      format.xml  { render :xml => @companyarts }
    end
  end
end
