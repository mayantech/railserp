require_dependency "search"

class Adress < ActiveRecord::Base
  belongs_to :company
  searches_on :all
end
