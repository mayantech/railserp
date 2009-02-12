require_dependency "search"

class Datetask < ActiveRecord::Base
    searches_on :all
    belongs_to :caldate
    belongs_to :datestatus
    belongs_to :dateprio
end
