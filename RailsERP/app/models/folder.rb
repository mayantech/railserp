require_dependency "search"

class Folder < ActiveRecord::Base
    searches_on :all
    has_many :filedatas
end
