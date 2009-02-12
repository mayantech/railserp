require 'rubygems'
require 'zip/zipfilesystem'

class ContactsController < ApplicationController
  # before_filter :login_required, :only => [:edit, :update]
  # GET /contacts
  # GET /contacts.xml
  # before_filter :login_required, :except => [ :index ]
  before_filter :login_required


  def index
    @contacts = Contact.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @contacts }
    end
  end

  # GET /contacts/1
  # GET /contacts/1.xml
  def show
    @contact = Contact.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @contact }
    end
  end

  # GET /contacts/new
  # GET /contacts/new.xml
  def new
    @contact = Contact.new
    @companies= Company.find(:all)

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @contact }
    end
  end

  # GET /contacts/1/edit
  def edit
    @companies= Company.find(:all)
    @contact = Contact.find(params[:id])
  end

  # POST /contacts
  # POST /contacts.xml
  def create
    @contact = Contact.new(params[:contact])

    respond_to do |format|
      if @contact.save
        flash[:notice] = 'Contact was successfully created.'
        format.html { redirect_to(@contact) }
        format.xml  { render :xml => @contact, :status => :created, :location => @contact }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @contact.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /contacts/1
  # PUT /contacts/1.xml
  def update
    @contact = Contact.find(params[:id])

    respond_to do |format|
      if @contact.update_attributes(params[:contact])
        flash[:notice] = 'Contact was successfully updated.'
        format.html { redirect_to(@contact) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @contact.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /contacts/1
  # DELETE /contacts/1.xml
  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy

    respond_to do |format|
      format.html { redirect_to(contacts_url) }
      format.xml  { head :ok }
    end
  end

  def search
    # @contacts = Contact.find(:all , :conditions =>{:name => params[:name]})
    @contacts = Contact.search params[:name]
    respond_to do |format|
      format.html { render :template =>"contacts/index"}
      format.xml  { render :xml => @contacts }
    end
  end

  def writeletter
    @contact = Contact.find(params[:id])
    result= `cp /Users/marcel/Desktop/RailsERP/public/vorlage.odt /Users/marcel/Desktop/RailsERP/public/Out.odt`
    Zip::ZipFile.open("/Users/marcel/Desktop/RailsERP/public/Out.odt") {
      |zipfile|
      contect=zipfile.file.read("content.xml")
      new=contect.gsub("%NAME%",@contact.name)
      new=new.gsub("%LASTNAME%",@contact.lastname)
      new=new.gsub("%EMAIL%",@contact.email)
      new=new.gsub("%TEL%",@contact.tel)
      new=new.gsub("%MOBILE%",@contact.mobile)
      new=new.gsub("%COMPANY%",@contact.company.name)
      new=new.gsub("%STREET%",@contact.company.adresses[0].street)
      new=new.gsub("%STREETNR%",@contact.company.adresses[0].streetnr.to_s)
      new=new.gsub("%ZIP%",@contact.company.adresses[0].zip.to_s)
      new=new.gsub("%AREA%",@contact.company.adresses[0].area)
      new=new.gsub("%LAND%",@contact.company.adresses[0].land)
      zipfile.file.open("content.xml", "w") { |f| f.puts new }
    }
  
    send_file "/Users/marcel/Desktop/RailsERP/public/Out.odt"
  end
  
end
