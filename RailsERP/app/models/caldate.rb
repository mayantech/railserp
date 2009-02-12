
require_dependency "search"

class Caldate < ActiveRecord::Base
  belongs_to :datestatus
  belongs_to :dateprio
  belongs_to :dateart
  belongs_to :contact
  has_many :datetasks
  searches_on :all
end
