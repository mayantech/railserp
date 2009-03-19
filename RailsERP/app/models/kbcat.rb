require_dependency "search"
# Knowlagebase Categorie Model like Support, Installation
class Kbcat < ActiveRecord::Base
      searches_on :all
      has_many :kbarticles
end
