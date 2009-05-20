# Controller Class for Knowlagebase Entry
class KbarticlesController < ApplicationController
  # GET /kbarticles
  # GET /kbarticles.xml
  before_filter :login_required
  before_filter :has_permission?
  # List all Knowlagebase Entries
  def index
    @kbarticles = Kbarticle.find(:all, :limit => @@listlimit )

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @kbarticles }
    end
  end

  # GET /kbarticles/1
  # GET /kbarticles/1.xml
  # Show a Knowlagebase Entry
  def show
    @kbarticle = Kbarticle.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @kbarticle }
    end
  end

  # GET /kbarticles/new
  # GET /kbarticles/new.xml
  # Create a Knowlagebase Entry
  def new
    @kbarticle = Kbarticle.new
    @kblangs= Kblang.find(:all)
    @kbcats= Kbcat.find(:all)
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @kbarticle }
    end
  end

  # GET /kbarticles/1/edit
  # Edit a Knowlagebase Entry
  def edit
    @kbarticle = Kbarticle.find(params[:id])
    @kblangs= Kblang.find(:all)
    @kbcats= Kbcat.find(:all)
  end

  # POST /kbarticles
  # POST /kbarticles.xml
  # Save a Knowlagebase Entry
  def create
    @kbarticle = Kbarticle.new(params[:kbarticle])

    respond_to do |format|
      if @kbarticle.save
        flash[:notice] = 'Kbarticle was successfully created.'
        format.html { redirect_to(@kbarticle) }
        format.xml  { render :xml => @kbarticle, :status => :created, :location => @kbarticle }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @kbarticle.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /kbarticles/1
  # PUT /kbarticles/1.xml
  # Update a Knowlagebase Entry
  def update
    @kbarticle = Kbarticle.find(params[:id])

    respond_to do |format|
      if @kbarticle.update_attributes(params[:kbarticle])
        flash[:notice] = 'Kbarticle was successfully updated.'
        format.html { redirect_to(@kbarticle) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @kbarticle.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /kbarticles/1
  # DELETE /kbarticles/1.xml
  # Delete a Knowlagebase Entry
  def destroy
    @kbarticle = Kbarticle.find(params[:id])
    @kbarticle.destroy

    respond_to do |format|
      format.html { redirect_to(kbarticles_url) }
      format.xml  { head :ok }
    end
  end

  # Search for a Knowlagebase Entry
  def search
    @kbarticles = Kbarticle.search params[:name]
    respond_to do |format|
      format.html { render :template =>"kbarticles/index"}
      format.xml  { render :xml => @kbarticles }
    end
  end

    # Search for a Knowlagebase Entry with a srting AJAX Search
  def live_search
    @phrase = params[:searchtext]
    @results = Kbarticle.search @phrase

    @number_match = @results.length

    render(:layout => false)
  end
end
