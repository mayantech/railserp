# Controller Class for Date Categorie
class DateartsController < ApplicationController
  # GET /datearts
  # GET /datearts.xml
   before_filter :login_required
  # List all Date Categories
  def index
    @datearts = Dateart.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @datearts }
    end
  end

  # GET /datearts/1
  # GET /datearts/1.xml
  # Show a Date Categorie
  def show
    @dateart = Dateart.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @dateart }
    end
  end

  # GET /datearts/new
  # GET /datearts/new.xml
  # Create a new Date Categorie
  def new
    @dateart = Dateart.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @dateart }
    end
  end

  # GET /datearts/1/edit
  # Edit a Date Categorie
  def edit
    @dateart = Dateart.find(params[:id])
  end

  # POST /datearts
  # POST /datearts.xml
  # Save a Date Categorie
  def create
    @dateart = Dateart.new(params[:dateart])

    respond_to do |format|
      if @dateart.save
        flash[:notice] = 'Dateart was successfully created.'
        format.html { redirect_to(@dateart) }
        format.xml  { render :xml => @dateart, :status => :created, :location => @dateart }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @dateart.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /datearts/1
  # PUT /datearts/1.xml
  # Update a Date Categorie
  def update
    @dateart = Dateart.find(params[:id])

    respond_to do |format|
      if @dateart.update_attributes(params[:dateart])
        flash[:notice] = 'Dateart was successfully updated.'
        format.html { redirect_to(@dateart) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @dateart.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /datearts/1
  # DELETE /datearts/1.xml
  # Delete a Date Categorie
  def destroy
    @dateart = Dateart.find(params[:id])
    @dateart.destroy

    respond_to do |format|
      format.html { redirect_to(datearts_url) }
      format.xml  { head :ok }
    end
  end

    # Search for a Date Categorie
    def search
    @datearts = Dateart.search params[:name]
    respond_to do |format|
      format.html { render :template =>"datearts/index"}
      format.xml  { render :xml => @datearts }
    end
  end

  # Search for a Date Categorie with a srting AJAX Search
  def live_search
    @phrase = params[:searchtext]
    @results = Dateart.search @phrase

    @number_match = @results.length

    render(:layout => false)
  end
end
