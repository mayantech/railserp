require_dependency "search"
# Knowlagebase language Example: German , English
class Kblang < ActiveRecord::Base
      searches_on :all
      has_many :kbarticles
end
