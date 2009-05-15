require_dependency "search"
# Calendar Prio Model like 1 2 3 4
class Dateprio < ActiveRecord::Base
  has_many :caldates
  has_many :datetasks
  searches_on :all

    # This method checks permissions for the :index action
    def self.is_indexable_by(user, parent = nil)
      if user.role.dateprio_read then
        return true
      end
    end

    # This method checks permissions for the :create and :new action
    def self.is_creatable_by(user, parent = nil)
      if user.role.dateprio_create then
        return true
      end
    end

    # This method checks permissions for the :show action
    def is_readable_by(user, parent = nil)
      if user.role.dateprio_read then
        return true
      end
    end

    # This method checks permissions for the :update and :edit action
    def is_updatable_by(user, parent = nil)
      if user.role.dateprio_update then
        return true
      end
    end

    # This method checks permissions for the :destroy action
    def is_deletable_by(user, parent = nil)
      if user.role.dateprio_delete then
        return true
      end
    end
end
