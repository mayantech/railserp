require_dependency "search"
# Calendar Status Model like Open, or Closed
class Datestatus < ActiveRecord::Base
  has_many :caldates
  has_many :datetasks
  searches_on :all
end
