require_dependency "search"
# Folder Model for Files
class Folder < ActiveRecord::Base
    searches_on :all
    has_many :filedatas
end
