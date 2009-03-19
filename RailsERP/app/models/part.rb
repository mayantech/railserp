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
end

