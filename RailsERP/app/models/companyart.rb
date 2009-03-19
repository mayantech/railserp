require_dependency "search"
# Company Categorien like Suppler and Partner
class Companyart < ActiveRecord::Base
  has_many :companies
  searches_on :all

  validates_presence_of :name
end
