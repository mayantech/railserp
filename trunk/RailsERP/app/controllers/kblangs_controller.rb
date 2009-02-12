class KblangsController < ApplicationController
  # GET /kblangs
  # GET /kblangs.xml
   before_filter :login_required
  def index
    @kblangs = Kblang.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @kblangs }
    end
  end

  # GET /kblangs/1
  # GET /kblangs/1.xml
  def show
    @kblang = Kblang.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @kblang }
    end
  end

  # GET /kblangs/new
  # GET /kblangs/new.xml
  def new
    @kblang = Kblang.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @kblang }
    end
  end

  # GET /kblangs/1/edit
  def edit
    @kblang = Kblang.find(params[:id])
  end

  # POST /kblangs
  # POST /kblangs.xml
  def create
    @kblang = Kblang.new(params[:kblang])

    respond_to do |format|
      if @kblang.save
        flash[:notice] = 'Kblang was successfully created.'
        format.html { redirect_to(@kblang) }
        format.xml  { render :xml => @kblang, :status => :created, :location => @kblang }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @kblang.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /kblangs/1
  # PUT /kblangs/1.xml
  def update
    @kblang = Kblang.find(params[:id])

    respond_to do |format|
      if @kblang.update_attributes(params[:kblang])
        flash[:notice] = 'Kblang was successfully updated.'
        format.html { redirect_to(@kblang) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @kblang.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /kblangs/1
  # DELETE /kblangs/1.xml
  def destroy
    @kblang = Kblang.find(params[:id])
    @kblang.destroy

    respond_to do |format|
      format.html { redirect_to(kblangs_url) }
      format.xml  { head :ok }
    end
  end

 def search
    @kblangs = Kblang.search params[:name]
    respond_to do |format|
      format.html { render :template =>"kblangs/index"}
      format.xml  { render :xml => @kblangs }
    end
  end
end
