require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "S3ify" do
  
  describe "copy_file_or_directory_to_s3" do
    before(:each) do
      FileUtils.rm(File.dirname(__FILE__) + '/fixtures/original/s3_index.html') if File.exists?(File.dirname(__FILE__) + '/fixtures/original/s3_index.html')
    end
  
    it "should create a new version of the file with a prefix of s3_ with the links converted to point at s3" do
      S3ify.stub!(:copy_file_or_directory_to_s3)
      S3ify.s3ify_folder(File.dirname(__FILE__) + '/fixtures/original', bucket = 'mattstest', s3_folder = 'mattspromo')
      File.open(File.dirname(__FILE__) + '/fixtures/original/s3_index.html').read.should eql(File.open(File.dirname(__FILE__) + '/fixtures/expected/index.html').read)
    end
  end
  
  
  describe "new_image_path" do
    it "should leave paths that atart with a slash" do
      S3ify.new_image_path("/images/pic1.png").should eql("/images/pic1.png")
    end
    
    it "should replace a ./ with just a slash" do
      S3ify.new_image_path("./images/pic1.png").should eql("/images/pic1.png")
    end
    
    it "should add a leading slash if there isn't one" do
      S3ify.new_image_path("images/pic1.png").should eql("/images/pic1.png")
    end
  end
end
