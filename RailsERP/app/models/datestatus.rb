require_dependency "search"

class Datestatus < ActiveRecord::Base
  has_many :caldates
  has_many :datetasks
  searches_on :all
end
