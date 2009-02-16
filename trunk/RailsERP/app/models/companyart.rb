require_dependency "search"
class Companyart < ActiveRecord::Base
  has_many :companies
  searches_on :all

  validates_presence_of :name
end
