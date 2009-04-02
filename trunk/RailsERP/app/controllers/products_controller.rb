# Controller Class for Products
class ProductsController < ApplicationController
  before_filter :login_required
  before_filter :has_permission?
  # GET /products
  # GET /products.xml
  # List all Product
  def index
    @products = Product.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @products }
    end
  end

  # GET /products/1
  # GET /products/1.xml
  # Show a Product
  def show
    @product = Product.find(params[:id])
    @parts = Part.find(:all)
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @product }
    end
  end

  # GET /products/new
  # GET /products/new.xml
  # Ceate a new Product
  def new
    @product = Product.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @product }
    end
  end

  # GET /products/1/edit
  # Edit a Product
  def edit
    @product = Product.find(params[:id])
  end

  # POST /products
  # POST /products.xml
  # Save a Product
  def create
    
    @product = Product.new(params[:product])
    @product.imagepath=@product.extension
    respond_to do |format|
      if @product.save
        flash[:notice] = 'Product was successfully created.'
        format.html { redirect_to(@product) }
        format.xml  { render :xml => @product, :status => :created, :location => @product }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @product.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /products/1
  # PUT /products/1.xml
  # Update a Product
  def update
    @product = Product.find(params[:id])
    @product.imagepath=@product.extension
    respond_to do |format|
      if @product.update_attributes(params[:product])
        flash[:notice] = 'Product was successfully updated.'
        format.html { redirect_to(@product) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @product.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.xml
  # Delete a Product
  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    respond_to do |format|
      format.html { redirect_to(products_url) }
      format.xml  { head :ok }
    end
  end
  def search
    @products = Product.search params[:name]
    respond_to do |format|
      format.html { render :template =>"products/index"}
      format.xml  { render :xml => @products }
    end
  end

  # Search for a Product with a srting AJAX Search
  def live_search
    @phrase = params[:searchtext]
    @results = Product.search @phrase

    @number_match = @results.length

    render(:layout => false)
  end

  # Add a Part to Product
  def addpart
    @product = Product.find(params['product']['id'])
    @product.parts << Part.find(params['add_parts'])
    redirect_to :action => 'show', :id => @product.id
  end
  # Delete a Part from a Product
  def delpart
    @product = Product.find(params['id'])
    @product.parts.delete(Part.find(params["partid"]))
    redirect_to :action => 'show', :id => @product.id
  end
end
