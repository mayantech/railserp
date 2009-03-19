require_dependency "search"
# Knowlagebase Comments Model
class Kbcomment < ActiveRecord::Base
      searches_on :all
      belongs_to :kbarticle
end
