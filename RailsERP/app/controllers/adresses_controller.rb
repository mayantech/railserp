# This ia the Adress Class Controller
class AdressesController < ApplicationController
  # GET /adresses
  # GET /adresses.xml
 before_filter :login_required
 before_filter :has_permission?
  # Rende Index and get all Data from Model
  def index
    @adresses = Adress.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @adresses }
    end
  end

  # GET /adresses/1
  # GET /adresses/1.xml
  # Show the Adress
  def show
    @adress = Adress.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @adress }
    end
  end

  # GET /adresses/new
  # GET /adresses/new.xml
  # Make new Adress
  def new
    @adress = Adress.new
    @companies= Company.find(:all)
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @adress }
    end
  end

  # GET /adresses/1/edit
  # Edit the Adress
  def edit
    @adress = Adress.find(params[:id])
    @companies= Company.find(:all)
  end

  # POST /adresses
  # POST /adresses.xml
  # Create new Adress
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
  # Update a Adress
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
  # Delete a Adress
  def destroy
    @adress = Adress.find(params[:id])
    @adress.destroy

    respond_to do |format|
      format.html { redirect_to(adresses_url) }
      format.xml  { head :ok }
    end
  end
  # Search a Adress 
  def search
    @adresses = Adress.search params[:name]
    respond_to do |format|
      format.html { render :template =>"adresses/index"}
      format.xml  { render :xml => @adresses }
    end
  end

    # Search for a Adress with a srting AJAX Search
  def live_search
    @phrase = params[:searchtext]
    @results = Adress.search @phrase

    @number_match = @results.length

    render(:layout => false)
  end
end
