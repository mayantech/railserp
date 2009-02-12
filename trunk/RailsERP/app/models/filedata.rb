require_dependency "search"

class Filedata < ActiveRecord::Base
  searches_on :all
  belongs_to :contact
  belongs_to :folder


  after_save :write_file
  after_destroy :delete_file

  def file=(file_data)

    @file_data = file_data
    if @file_data.instance_of?(String)
      @filenotupload = true
    else
      @filenotupload = false
    end
  end

  def write_file
    if @filenotupload == false
      if @file_data
        FileUtils.makedirs("/Users/marcel/Desktop/RailsERP/public/files/#{id}")
        File.open("/Users/marcel/Desktop/RailsERP/public/files/#{id}/#{id}.#{extension}", "w") { |file| file.write(@file_data.read) }
        # put calls to other logic here - resizing, conversion etc.
      end
    end
  end

  # deletes the file(s) by removing the whole dir
  def delete_file
    FileUtils.rm_rf("/Users/marcel/Desktop/RailsERP/public/files/#{id}")
  end

  # just gets the extension of uploaded file
  def extension
    if @filenotupload == false
      @file_data.original_filename.split(".").last
    end
  end

  def filename
    if @filenotupload == false
      @file_data.original_filename.split(".").first
    end
  end
  
  def filesize
    if @filenotupload == false
      @file_data.size
    end
  end

end

