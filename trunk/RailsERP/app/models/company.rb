require_dependency "search"
# All COmpanyies are in this Model
class Company < ActiveRecord::Base
  has_many :contacts
  has_many :adresses
  belongs_to :companyart
  searches_on :all

  validates_presence_of :name
end
