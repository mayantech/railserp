require_dependency "search"
# This is the File Data Model
class Filedata < ActiveRecord::Base
  searches_on :all
  belongs_to :contact
  belongs_to :folder


  after_save :write_file
  after_destroy :delete_file
  # File Funktion
  def file=(file_data)

    @file_data = file_data
    if @file_data.instance_of?(String)
      @filenotupload = true
    else
      @filenotupload = false
    end
  end

  # File Write funktion
  def write_file
    if @filenotupload == false
      if @file_data
        FileUtils.makedirs(APP_CONFIG['RailsERPPath']+"public/files/#{id}")
        File.open(APP_CONFIG['RailsERPPath']+"public/files/#{id}/#{id}.#{extension}", "w") { |file| file.write(@file_data.read) }
        # put calls to other logic here - resizing, conversion etc.
      end
    end
  end

  # deletes the file(s) by removing the whole dir
  def delete_file
    FileUtils.rm_rf(APP_CONFIG['RailsERPPath']+"/public/files/#{id}")
  end

  # just gets the extension of uploaded file
  def extension
    if @filenotupload == false
      @file_data.original_filename.split(".").last
    end
  end

  # Get File name from FIle
  def filename
    if @filenotupload == false
      @file_data.original_filename.split(".").first
    end
  end
  #Get file Size
  def filesize
    if @filenotupload == false
      @file_data.size
    end
  end

end

