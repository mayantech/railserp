require_dependency "search"
# The Model for Contacts
class Contact < ActiveRecord::Base
  belongs_to :company
  has_many :caldates
  has_many :filedatas
  searches_on :all

    # This method checks permissions for the :index action
    def self.is_indexable_by(user, parent = nil)
      if user.role.contact_read then
        return true
      end
    end

    # This method checks permissions for the :create and :new action
    def self.is_creatable_by(user, parent = nil)
      if user.role.contact_create then
        return true
      end
    end

    # This method checks permissions for the :show action
    def is_readable_by(user, parent = nil)
      if user.role.contact_read then
        return true
      end
    end

    # This method checks permissions for the :update and :edit action
    def is_updatable_by(user, parent = nil)
      if user.role.contact_update then
        return true
      end
    end

    # This method checks permissions for the :destroy action
    def is_deletable_by(user, parent = nil)
      if user.role.contact_delete then
        return true
      end
    end

  #validates_presence_of :name, :last_name, :position, :tel, :mobile, :email, :Info, :birthday, :company_id
end
