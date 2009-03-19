require_dependency "search"
# Knowlagebase Entry Model
class Kbarticle < ActiveRecord::Base
      searches_on :all
      has_many :kbcomments
      belongs_to :kblang
      belongs_to :kbcat
end
