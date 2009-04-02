require_dependency "search"
# Company Categorien like Suppler and Partner
class Companyart < ActiveRecord::Base
  has_many :companies
  searches_on :all

  validates_presence_of :name
    # This method checks permissions for the :index action
    def self.is_indexable_by(user, parent = nil)
      if user.role.companyart_read then
        return true
      end
    end

    # This method checks permissions for the :create and :new action
    def self.is_creatable_by(user, parent = nil)
      if user.role.companyart_create then
        return true
      end
    end

    # This method checks permissions for the :show action
    def is_readable_by(user, parent = nil)
      if user.role.companyart_read then
        return true
      end
    end

    # This method checks permissions for the :update and :edit action
    def is_updatable_by(user, parent = nil)
      if user.role.companyart_update then
        return true
      end
    end

    # This method checks permissions for the :destroy action
    def is_deletable_by(user, parent = nil)
      if user.role.companyart_delete then
        return true
      end
    end
end
