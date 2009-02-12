require_dependency "search"
class Kbcat < ActiveRecord::Base
      searches_on :all
      has_many :kbarticles
end
