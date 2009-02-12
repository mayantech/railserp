require_dependency "search"
class Kblang < ActiveRecord::Base
      searches_on :all
      has_many :kbarticles
end
