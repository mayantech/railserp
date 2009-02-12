require_dependency "search"

class Dateart < ActiveRecord::Base
  has_many :caldates
  searches_on :all
end
