require_dependency "search"
# Parts Model Class this Parts belongs to a product
class Part < ActiveRecord::Base
  searches_on :all
  has_and_belongs_to_many :products

  after_save :write_file
  after_destroy :delete_file
  #Def Image Save
  def file=(file_data)
    @file_data = file_data
    if @file_data.instance_of?(String)
      @filenotupload = true
    else
      @filenotupload = false
    end
  end
  #Write Image
  def write_file
    if @filenotupload == false
      if @file_data
        FileUtils.makedirs(APP_CONFIG['RailsERPPath']+"public/images/parts/#{id}")
        File.open(APP_CONFIG['RailsERPPath']+"public/images/parts/#{id}/#{id}.#{extension}", "w") { |file| file.write(@file_data.read) }
        # put calls to other logic here - resizing, conversion etc.
      end
    end
  end

  # deletes the file(s) by removing the whole dir
  def delete_file
    FileUtils.rm_rf(APP_CONFIG['RailsERPPath']+"public/images/parts/#{id}")
  end

  # just gets the extension of uploaded file
  def extension
    if @filenotupload == false
      @file_data.original_filename.split(".").last
    end
  end

    # This method checks permissions for the :index action
    def self.is_indexable_by(user, parent = nil)
      if user.role.part_read then
        return true
      end
    end

    # This method checks permissions for the :create and :new action
    def self.is_creatable_by(user, parent = nil)
      if user.role.part_create then
        return true
      end
    end

    # This method checks permissions for the :show action
    def is_readable_by(user, parent = nil)
      if user.role.part_read then
        return true
      end
    end

    # This method checks permissions for the :update and :edit action
    def is_updatable_by(user, parent = nil)
      if user.role.part_update then
        return true
      end
    end

    # This method checks permissions for the :destroy action
    def is_deletable_by(user, parent = nil)
      if user.role.part_delete then
        return true
      end
    end
end

