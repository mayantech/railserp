require_dependency "search"

# All Adress Information belongs_to Company
class Adress < ActiveRecord::Base
  belongs_to :company
  searches_on :all
end
