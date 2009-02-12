require_dependency "search"
class Kbcomment < ActiveRecord::Base
      searches_on :all
      belongs_to :kbarticle
end
