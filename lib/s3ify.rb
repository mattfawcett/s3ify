require 'rubygems'
require 'aws/s3'
require 'nokogiri'


module S3ify
  
  AWS::S3::Base.establish_connection!(
    :access_key_id     => ENV['AMAZON_ACCESS_KEY_ID'],
    :secret_access_key => ENV['AMAZON_SECRET_ACCESS_KEY']
  )
      
  def self.s3ify_folder(path, bucket, s3_folder)
    s3_folder = Time.now.to_i.to_s if s3_folder.nil?
    final_html_paths = []
    @base_path = path
    Dir.entries( path ).each do |entry|      
      if entry =~ /html/ && !entry.match(/^s3\_/)
        output = File.new("#{path}/s3_#{entry}", "w")
        doc = Nokogiri::HTML(open(path + "/" + entry))
        doc.css('img').each do |image| 
          unless image['src'] =~ /^http/
            image.set_attribute 'src', "http://#{bucket}.s3.amazonaws.com/#{s3_folder}#{new_image_path(image['src'])}"            
          end
        end
        output.puts doc
        output.close
        final_html_paths << "http://#{bucket}.s3.amazonaws.com/#{s3_folder}/s3_#{entry}"
      end
    end
    copy_file_or_directory_to_s3(path, bucket, s3_folder)
    return final_html_paths
  end  
  
  def self.copy_file_or_directory_to_s3(file_name, bucket, s3_folder)
    fstat = File.stat(file_name)    
    copy_file_to_s3(file_name, bucket, s3_folder) if fstat.file? || fstat.symlink?

    if fstat.directory? 
      Dir.entries(file_name).each do |entry| 
        copy_file_or_directory_to_s3(file_name + "/" + entry, bucket, s3_folder) unless entry =~ /^\./
      end 
    end
  end
  
  def self.copy_file_to_s3(file_name, bucket, s3_folder)    
    AWS::S3::S3Object.store(s3_folder + file_name.gsub(@base_path, ''), open(file_name), bucket, :access => :public_read)    
  end
  
  def self.new_image_path(old_path)
    if old_path =~ /^\.\//
      return old_path.gsub(/^\.\//, '/')
    elsif !old_path.match(/^\//)
      return "/" + old_path
    end
    return old_path
  end
  
  
end