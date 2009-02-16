require_dependency "search"

class Contact < ActiveRecord::Base
  belongs_to :company
  has_many :caldates
  has_many :filedatas
  searches_on :all

  validates_presence_of :name, :last_name, :position, :tel, :mobile, :email, :Info, :birthday, :company_id
end
