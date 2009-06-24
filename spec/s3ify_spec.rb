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
  
  describe "uploading of files to S3" do    
    it "each file should get uploaded to the correct folder in the correct bucket" do
      S3ify.should_receive(:open).with(File.dirname(__FILE__) + '/fixtures/original/index.html').at_least(:once).and_return(mock_index = File.open(File.dirname(__FILE__) + '/fixtures/original/index.html'))
      AWS::S3::S3Object.should_receive(:store).with('mattspromo/index.html', mock_index, 'mattstest', {:access=>:public_read})
      
      S3ify.should_receive(:open).with(File.dirname(__FILE__) + '/fixtures/original/s3_index.html').at_least(:once).and_return(mock_s3_index = File.open(File.dirname(__FILE__) + '/fixtures/original/s3_index.html'))
      AWS::S3::S3Object.should_receive(:store).with('mattspromo/s3_index.html', mock_s3_index, 'mattstest', {:access=>:public_read})                  
      
      S3ify.should_receive(:open).with(File.dirname(__FILE__) + '/fixtures/original/images/image1.jpg').at_least(:once).and_return(mock_image_1 = File.open(File.dirname(__FILE__) + '/fixtures/original/images/image1.jpg'))
      AWS::S3::S3Object.should_receive(:store).with('mattspromo/images/image1.jpg', mock_image_1, 'mattstest', {:access=>:public_read})
      
      S3ify.should_receive(:open).with(File.dirname(__FILE__) + '/fixtures/original/images/image2.jpg').at_least(:once).and_return(mock_image_2 = File.open(File.dirname(__FILE__) + '/fixtures/original/images/image2.jpg'))
      AWS::S3::S3Object.should_receive(:store).with('mattspromo/images/image2.jpg', mock_image_2, 'mattstest', {:access=>:public_read})
      
      S3ify.should_receive(:open).with(File.dirname(__FILE__) + '/fixtures/original/images/image3.jpg').at_least(:once).and_return(mock_image_3 = File.open(File.dirname(__FILE__) + '/fixtures/original/images/image3.jpg'))
      AWS::S3::S3Object.should_receive(:store).with('mattspromo/images/image3.jpg', mock_image_3, 'mattstest', {:access=>:public_read})
      
      S3ify.should_receive(:open).with(File.dirname(__FILE__) + '/fixtures/original/images/nested/image4.jpg').at_least(:once).and_return(mock_image_4 = File.open(File.dirname(__FILE__) + '/fixtures/original/images/nested/image4.jpg'))
      AWS::S3::S3Object.should_receive(:store).with('mattspromo/images/nested/image4.jpg', mock_image_4, 'mattstest', {:access=>:public_read})
                           
      S3ify.s3ify_folder(File.dirname(__FILE__) + '/fixtures/original', bucket = 'mattstest', s3_folder = 'mattspromo')      
    end
  end
end