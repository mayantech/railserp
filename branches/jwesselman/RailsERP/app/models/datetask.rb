require_dependency "search"
# Calendar Task Model
class Datetask < ActiveRecord::Base
    searches_on :all
    belongs_to :caldate
    belongs_to :datestatus
    belongs_to :dateprio

    # This method checks permissions for the :index action
    def self.is_indexable_by(user, parent = nil)
      if user.role.datetask_read then
        return true
      end
    end

    # This method checks permissions for the :create and :new action
    def self.is_creatable_by(user, parent = nil)
      if user.role.datetask_create then
        return true
      end
    end

    # This method checks permissions for the :show action
    def is_readable_by(user, parent = nil)
      if user.role.datetask_read then
        return true
      end
    end

    # This method checks permissions for the :update and :edit action
    def is_updatable_by(user, parent = nil)
      if user.role.datetask_update then
        return true
      end
    end

    # This method checks permissions for the :destroy action
    def is_deletable_by(user, parent = nil)
      if user.role.datetask_delete then
        return true
      end
    end
end
