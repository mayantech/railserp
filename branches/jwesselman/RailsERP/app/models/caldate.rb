
require_dependency "search"
# Caledar Entries
class Caldate < ActiveRecord::Base
  belongs_to :datestatus
  belongs_to :dateprio
  belongs_to :dateart
  belongs_to :contact
  has_many :datetasks
  searches_on :all

    # This method checks permissions for the :index action
    def self.is_indexable_by(user, parent = nil)
      if user.role.caldate_read then
        return true
      end
    end

    # This method checks permissions for the :create and :new action
    def self.is_creatable_by(user, parent = nil)
      if user.role.caldate_create then
        return true
      end
    end

    # This method checks permissions for the :show action
    def is_readable_by(user, parent = nil)
      if user.role.caldate_read then
        return true
      end
    end

    # This method checks permissions for the :update and :edit action
    def is_updatable_by(user, parent = nil)
      if user.role.caldate_update then
        return true
      end
    end

    # This method checks permissions for the :destroy action
    def is_deletable_by(user, parent = nil)
      if user.role.caldate_delete then
        return true
      end
    end
end
