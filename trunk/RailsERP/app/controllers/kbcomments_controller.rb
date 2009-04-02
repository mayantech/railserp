# Controller Class for Knowlagebase Comment
class KbcommentsController < ApplicationController
  # GET /kbcomments
  # GET /kbcomments.xml
  before_filter :login_required
  before_filter :has_permission?
  # List all Knowlagebase Commentes
  def index
    @kbcomments = Kbcomment.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @kbcomments }
    end
  end

  # GET /kbcomments/1
  # GET /kbcomments/1.xml
  # Show a Knowlagebase Comment
  def show
    @kbcomment = Kbcomment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @kbcomment }
    end
  end

  # GET /kbcomments/new
  # GET /kbcomments/new.xml
  # Create a new Knowlagebase Comment
  def new
    @kbcomment = Kbcomment.new
    @kbarticles = Kbarticle.find(:all)
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @kbcomment }
    end
  end

  # GET /kbcomments/1/edit
  # Edit a Knowlagebase Comment
  def edit
    @kbcomment = Kbcomment.find(params[:id])
    @kbarticles = Kbarticle.find(:all)
  end

  # POST /kbcomments
  # POST /kbcomments.xml
  # Save a Knowlagebase Comment
  def create
    @kbcomment = Kbcomment.new(params[:kbcomment])

    respond_to do |format|
      if @kbcomment.save
        flash[:notice] = 'Kbcomment was successfully created.'
        format.html { redirect_to(@kbcomment) }
        format.xml  { render :xml => @kbcomment, :status => :created, :location => @kbcomment }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @kbcomment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /kbcomments/1
  # PUT /kbcomments/1.xml
  # Update a Knowlagebase Comment
  def update
    @kbcomment = Kbcomment.find(params[:id])

    respond_to do |format|
      if @kbcomment.update_attributes(params[:kbcomment])
        flash[:notice] = 'Kbcomment was successfully updated.'
        format.html { redirect_to(@kbcomment) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @kbcomment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /kbcomments/1
  # DELETE /kbcomments/1.xml
  # Delete a Knowlagebase Comment
  def destroy
    @kbcomment = Kbcomment.find(params[:id])
    @kbcomment.destroy

    respond_to do |format|
      format.html { redirect_to(kbcomments_url) }
      format.xml  { head :ok }
    end
  end

  # Search for a Knowlagebase Comment
  def search
    @kbcomments = Kbcomment.search params[:name]
    respond_to do |format|
      format.html { render :template =>"kbcomments/index"}
      format.xml  { render :xml => @kbcomments }
    end
  end

  # Search for a KB COmment with a srting AJAX Search
  def live_search
    @phrase = params[:searchtext]
    @results = Kbcomment.search @phrase

    @number_match = @results.length

    render(:layout => false)
  end
end
