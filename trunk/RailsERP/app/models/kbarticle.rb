require_dependency "search"
# Knowlagebase Entry Model
class Kbarticle < ActiveRecord::Base
      searches_on :all
      has_many :kbcomments
      belongs_to :kblang
      belongs_to :kbcat

    # This method checks permissions for the :index action
    def self.is_indexable_by(user, parent = nil)
      if user.role.kbarticle_read then
        return true
      end
    end

    # This method checks permissions for the :create and :new action
    def self.is_creatable_by(user, parent = nil)
      if user.role.kbarticle_create then
        return true
      end
    end

    # This method checks permissions for the :show action
    def is_readable_by(user, parent = nil)
      if user.role.kbarticle_read then
        return true
      end
    end

    # This method checks permissions for the :update and :edit action
    def is_updatable_by(user, parent = nil)
      if user.role.kbarticle_update then
        return true
      end
    end

    # This method checks permissions for the :destroy action
    def is_deletable_by(user, parent = nil)
      if user.role.kbarticle_delete then
        return true
      end
    end
end
