require_dependency "search"
# This are the Startpage
class Dashblog < ActiveRecord::Base
  searches_on :all
end
