require_dependency "search"
# Calendar Task Model
class Datetask < ActiveRecord::Base
    searches_on :all
    belongs_to :caldate
    belongs_to :datestatus
    belongs_to :dateprio
end
