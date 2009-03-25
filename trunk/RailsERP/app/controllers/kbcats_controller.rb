# Controller Class for Knowlagebase Categorie
class KbcatsController < ApplicationController
  # GET /kbcats
  # GET /kbcats.xml
  before_filter :login_required
  # List all Knowlagebase Categorie
  def index
    @kbcats = Kbcat.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @kbcats }
    end
  end

  # GET /kbcats/1
  # GET /kbcats/1.xml
  # Show a Knowlagebase Categorie
  def show
    @kbcat = Kbcat.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @kbcat }
    end
  end

  # GET /kbcats/new
  # GET /kbcats/new.xml
  # Create a new Knowlagebase Categorie
  def new
    @kbcat = Kbcat.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @kbcat }
    end
  end

  # GET /kbcats/1/edit
  # Edit a Knowlagebase Categorie
  def edit
    @kbcat = Kbcat.find(params[:id])
  end

  # POST /kbcats
  # POST /kbcats.xml
  # Save a Knowlagebase Categorie
  def create
    @kbcat = Kbcat.new(params[:kbcat])

    respond_to do |format|
      if @kbcat.save
        flash[:notice] = 'Kbcat was successfully created.'
        format.html { redirect_to(@kbcat) }
        format.xml  { render :xml => @kbcat, :status => :created, :location => @kbcat }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @kbcat.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /kbcats/1
  # PUT /kbcats/1.xml
  # Update a Knowlagebase Categorie
  def update
    @kbcat = Kbcat.find(params[:id])

    respond_to do |format|
      if @kbcat.update_attributes(params[:kbcat])
        flash[:notice] = 'Kbcat was successfully updated.'
        format.html { redirect_to(@kbcat) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @kbcat.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /kbcats/1
  # DELETE /kbcats/1.xml
  # Delete a Knowlagebase Categorie
  def destroy
    @kbcat = Kbcat.find(params[:id])
    @kbcat.destroy

    respond_to do |format|
      format.html { redirect_to(kbcats_url) }
      format.xml  { head :ok }
    end
  end

  # Search for a Knowlagebase Categorie
  def search
    @kbcats = Kbcat.search params[:name]
    respond_to do |format|
      format.html { render :template =>"kbcats/index"}
      format.xml  { render :xml => @kbcats }
    end
  end

  # Search for a Knowlagebase Categorie with a srting AJAX Search
  def live_search
    @phrase = params[:searchtext]
    @results = Kbcat.search @phrase

    @number_match = @results.length

    render(:layout => false)
  end
end
