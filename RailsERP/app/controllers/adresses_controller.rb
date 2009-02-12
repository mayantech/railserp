class AdressesController < ApplicationController
  # GET /adresses
  # GET /adresses.xml
 before_filter :login_required
  def index
    @adresses = Adress.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @adresses }
    end
  end

  # GET /adresses/1
  # GET /adresses/1.xml
  def show
    @adress = Adress.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @adress }
    end
  end

  # GET /adresses/new
  # GET /adresses/new.xml
  def new
    @adress = Adress.new
    @companies= Company.find(:all)
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @adress }
    end
  end

  # GET /adresses/1/edit
  def edit
    @adress = Adress.find(params[:id])
    @companies= Company.find(:all)
  end

  # POST /adresses
  # POST /adresses.xml
  def create
    @adress = Adress.new(params[:adress])

    respond_to do |format|
      if @adress.save
        flash[:notice] = 'Adress was successfully created.'
        format.html { redirect_to(@adress) }
        format.xml  { render :xml => @adress, :status => :created, :location => @adress }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @adress.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /adresses/1
  # PUT /adresses/1.xml
  def update
    @adress = Adress.find(params[:id])

    respond_to do |format|
      if @adress.update_attributes(params[:adress])
        flash[:notice] = 'Adress was successfully updated.'
        format.html { redirect_to(@adress) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @adress.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /adresses/1
  # DELETE /adresses/1.xml
  def destroy
    @adress = Adress.find(params[:id])
    @adress.destroy

    respond_to do |format|
      format.html { redirect_to(adresses_url) }
      format.xml  { head :ok }
    end
  end
  def search
    @adresses = Adress.search params[:name]
    respond_to do |format|
      format.html { render :template =>"adresses/index"}
      format.xml  { render :xml => @adresses }
    end
  end
end
