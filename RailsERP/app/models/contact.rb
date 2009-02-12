require_dependency "search"

class Contact < ActiveRecord::Base
  belongs_to :company
  has_many :caldates
  has_many :filedatas
  searches_on :all
end
