require_dependency "search"
class Dashblog < ActiveRecord::Base
  searches_on :all
end
