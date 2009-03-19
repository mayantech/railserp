require_dependency "search"
# Calendar Arts like Marcel, or Navi as Example
class Dateart < ActiveRecord::Base
  has_many :caldates
  searches_on :all
end
