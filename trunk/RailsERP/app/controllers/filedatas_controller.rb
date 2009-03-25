# Controller Class for File
class FiledatasController < ApplicationController
  # GET /filedatas
  # GET /filedatas.xml
   before_filter :login_required
  # List all Files
  def index
    @filedatas = Filedata.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @filedatas }
    end
  end

  # GET /filedatas/1
  # GET /filedatas/1.xml
  # Show a File
  def show
    @filedata = Filedata.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @filedata }
    end
  end

  # GET /filedatas/new
  # GET /filedatas/new.xml
  # Create a new File
  def new
    @filedata = Filedata.new
    @folders = Folder.find(:all)
    @contacts = Contact.find(:all)

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @filedata }
    end
  end

  # GET /filedatas/1/edit
  # Edit a FIle
  def edit
    @filedata = Filedata.find(params[:id])
    @folders = Folder.find(:all)
    @contacts = Contact.find(:all)
  end

  # POST /filedatas
  # POST /filedatas.xml
  # Save a File
  def create
    @filedata = Filedata.new(params[:filedata])
    @filedata.ext=@filedata.extension
    @filedata.name=@filedata.filename
    @filedata.size=@filedata.filesize

    respond_to do |format|
      if @filedata.save
        flash[:notice] = 'Filedata was successfully created.'
        format.html { redirect_to(@filedata) }
        format.xml  { render :xml => @filedata, :status => :created, :location => @filedata }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @filedata.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /filedatas/1
  # PUT /filedatas/1.xml
  # Update a File
  def update
    @filedata = Filedata.find(params[:id])
    @filedata.ext=@filedata.extension
    @filedata.name=@filedata.filename
    @filedata.size=@filedata.filesize
    
    respond_to do |format|
      if @filedata.update_attributes(params[:filedata])
        flash[:notice] = 'Filedata was successfully updated.'
        format.html { redirect_to(@filedata) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @filedata.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /filedatas/1
  # DELETE /filedatas/1.xml
  # Delete a File
  def destroy
    @filedata = Filedata.find(params[:id])
    @filedata.destroy

    respond_to do |format|
      format.html { redirect_to(filedatas_url) }
      format.xml  { head :ok }
    end
  end

  # Search for a File
  def search
    @filedatas = Filedata.search params[:name]
    respond_to do |format|
      format.html { render :template =>"filedatas/index"}
      format.xml  { render :xml => @filedatas }
    end
  end

  # Search for a File with a srting AJAX Search
  def live_search
    @phrase = params[:searchtext]
    @results = Filedata.search @phrase

    @number_match = @results.length

    render(:layout => false)
  end

end
