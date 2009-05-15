# Controller Class for Startpage
class DashboardsController < ApplicationController
before_filter :login_required, :except => [ :index ]
before_filter :has_permission?, :except => [ :index , :live_search]
  #render the Startpage
  def index
    @dashblogs = Dashblog.find(:all, :conditions => {:published => true} )
  end

  # Search over All with a srting AJAX Search
  def live_search
    @phrase = params[:searchtext]

    @adresses = Adress.search @phrase
    @caldates = Caldate.search @phrase
    @companies = Company.search @phrase
    @companyarts = Companyart.search @phrase
    @contacts = Contact.search @phrase
    @dashblogs = Dashblog.search @phrase
    @datearts = Dateart.search @phrase
    @dateprios = Dateprio.search @phrase
    @datestatuses = Datestatus.search @phrase
    @datetasks = Datetask.search @phrase
    @filedatas = Filedata.search @phrase
    @folders = Folder.search @phrase
    @kbarticles = Kbarticle.search @phrase
    @kbcats = Kbcat.search @phrase
    @kbcomments = Kbcomment.search @phrase
    @kblangs = Kblang.search @phrase
    @parts = Part.search @phrase
    @products = Product.search @phrase


    @adresses_match = @adresses.length
    @caldates_match = @caldates.length
    @companies_match = @companies.length
    @companyarts_match = @companyarts.length
    @contacts_match = @contacts.length
    @dashblogs_match = @dashblogs.length
    @datearts_match = @datearts.length
    @dateprios_match = @dateprios.length
    @datestatuses_match = @datestatuses.length
    @datetasks_match = @datetasks.length
    @filedatas_match = @filedatas.length
    @folders_match = @folders.length
    @kbarticles_match = @kbarticles.length
    @kbcats_match = @kbcats.length
    @kbcomments_match = @kbcomments.length
    @kblangs_match = @kblangs.length
    @parts_match = @parts.length
    @products_match = @products.length

    render(:layout => false)
  end
end
