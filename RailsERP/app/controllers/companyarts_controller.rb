# Controller Class for Company Categories
class CompanyartsController < ApplicationController
  
  # GET /companyarts
  # GET /companyarts.xml
  before_filter :login_required
  before_filter :has_permission?
  # List all Categories
  def index
    @companyarts = Companyart.find(:all, :limit => @@listlimit )

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @companyarts }
    end
  end

  # GET /companyarts/1
  # GET /companyarts/1.xml
  # Show a Categories
  def show
    @companyart = Companyart.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @companyart }
    end
  end

  # GET /companyarts/new
  # GET /companyarts/new.xml
  # Create a Categorie
  def new
    @companyart = Companyart.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @companyart }
    end
  end

  # GET /companyarts/1/edit
  # Edit a Categorie
  def edit
    @companyart = Companyart.find(params[:id])
  end

  # POST /companyarts
  # POST /companyarts.xml
  # Save a Categorie
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
  # Update a Categorie
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
  # Delete a Categorie
  def destroy
    @companyart = Companyart.find(params[:id])
    @companyart.destroy

    respond_to do |format|
      format.html { redirect_to(companyarts_url) }
      format.xml  { head :ok }
    end
  end

  # Search for a Categorie
  def search
    @companyarts = Companyart.search params[:name]
    respond_to do |format|
      format.html { render :template =>"companyarts/index"}
      format.xml  { render :xml => @companyarts }
    end
  end
    # Search for a Categorie with a srting AJAX Search
  def live_search
    @phrase = params[:searchtext]
    @results = Companyart.search @phrase

    @number_match = @results.length

    render(:layout => false)
  end
end
