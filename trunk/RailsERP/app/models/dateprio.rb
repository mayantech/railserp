require_dependency "search"
# Calendar Prio Model like 1 2 3 4
class Dateprio < ActiveRecord::Base
  has_many :caldates
  has_many :datetasks
  searches_on :all
end
