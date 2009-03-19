# Controller Class for Parts
class PartsController < ApplicationController
  # GET /parts
  # GET /parts.xml
  before_filter :login_required
  # List all Parts
  def index
    @parts = Part.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @parts }
    end
  end

  # GET /parts/1
  # GET /parts/1.xml
  # Show a Part
  def show
    @part = Part.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @part }
    end
  end

  # GET /parts/new
  # GET /parts/new.xml
  # Create a new Part
  def new
    @part = Part.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @part }
    end
  end

  # GET /parts/1/edit
  # Edit a Part
  def edit
    @part = Part.find(params[:id])
  end

  # POST /parts
  # POST /parts.xml
  # Save a Part
  def create
    @part = Part.new(params[:part])
    @part.imageext=@part.extension
    respond_to do |format|
      if @part.save
        flash[:notice] = 'Part was successfully created.'
        format.html { redirect_to(@part) }
        format.xml  { render :xml => @part, :status => :created, :location => @part }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @part.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /parts/1
  # PUT /parts/1.xml
  # Update a Part
  def update
    @part = Part.find(params[:id])

    respond_to do |format|
      if @part.update_attributes(params[:part])
        flash[:notice] = 'Part was successfully updated.'
        format.html { redirect_to(@part) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @part.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /parts/1
  # DELETE /parts/1.xml
  # Delete Part
  def destroy
    @part = Part.find(params[:id])
    @part.destroy

    respond_to do |format|
      format.html { redirect_to(parts_url) }
      format.xml  { head :ok }
    end
  end

  # Search a Part
  def search
    @parts = Part.search params[:name]
    respond_to do |format|
      format.html { render :template =>"parts/index"}
      format.xml  { render :xml => @parts }
    end
  end
end
