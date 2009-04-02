require_dependency "search"
# All COmpanyies are in this Model
class Company < ActiveRecord::Base
  has_many :contacts
  has_many :adresses
  belongs_to :companyart
  searches_on :all

  validates_presence_of :name

    # This method checks permissions for the :index action
    def self.is_indexable_by(user, parent = nil)
      if user.role.company_read then
        return true
      end
    end

    # This method checks permissions for the :create and :new action
    def self.is_creatable_by(user, parent = nil)
      if user.role.company_create then
        return true
      end
    end

    # This method checks permissions for the :show action
    def is_readable_by(user, parent = nil)
      if user.role.company_read then
        return true
      end
    end

    # This method checks permissions for the :update and :edit action
    def is_updatable_by(user, parent = nil)
      if user.role.company_update then
        return true
      end
    end

    # This method checks permissions for the :destroy action
    def is_deletable_by(user, parent = nil)
      if user.role.company_delete then
        return true
      end
    end
end
