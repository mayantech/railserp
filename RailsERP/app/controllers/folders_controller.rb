# Controller Class for Folder
class FoldersController < ApplicationController
  # GET /folders
  # GET /folders.xml
   before_filter :login_required
  # List all Folders
  def index
    @folders = Folder.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @folders }
    end
  end

  # GET /folders/1
  # GET /folders/1.xml
  # Show Folder
  def show
    @folder = Folder.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @folder }
    end
  end

  # GET /folders/new
  # GET /folders/new.xml
  # Create a Folder
  def new
    @folder = Folder.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @folder }
    end
  end

  # GET /folders/1/edit
  # Edit a Folder
  def edit
    @folder = Folder.find(params[:id])
  end

  # POST /folders
  # POST /folders.xml
  # Save a Folder
  def create
    @folder = Folder.new(params[:folder])

    respond_to do |format|
      if @folder.save
        flash[:notice] = 'Folder was successfully created.'
        format.html { redirect_to(@folder) }
        format.xml  { render :xml => @folder, :status => :created, :location => @folder }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @folder.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /folders/1
  # PUT /folders/1.xml
  # Update a Folder
  def update
    @folder = Folder.find(params[:id])

    respond_to do |format|
      if @folder.update_attributes(params[:folder])
        flash[:notice] = 'Folder was successfully updated.'
        format.html { redirect_to(@folder) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @folder.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /folders/1
  # DELETE /folders/1.xml
  # Delete a Folder
  def destroy
    @folder = Folder.find(params[:id])
    @folder.destroy

    respond_to do |format|
      format.html { redirect_to(folders_url) }
      format.xml  { head :ok }
    end
  end

 # Search a Folder
 def search
    @folders = Folder.search params[:name]
    respond_to do |format|
      format.html { render :template =>"folders/index"}
      format.xml  { render :xml => @folders }
    end
  end

   # Search for a Folder with a srting AJAX Search
  def live_search
    @phrase = params[:searchtext]
    @results = Folder.search @phrase

    @number_match = @results.length

    render(:layout => false)
  end
end
