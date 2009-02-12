require_dependency "search"

class Dateprio < ActiveRecord::Base
  has_many :caldates
  has_many :datetasks
  searches_on :all
end
