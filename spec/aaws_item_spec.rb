require File.dirname(__FILE__) + '/spec_helper.rb'

describe AAWS::Item do
  it "should have operation default param" do
    AAWS::Item.default_params.has_key?(:operation).should == true
  end
  
  describe "search results" do
    before(:each) do
      AAWS::Base.establish_connection('blah')
      xml = open(File.dirname(__FILE__) + '/fixtures/item_search_harry_potter.xml').read
      AAWS::Item.should_receive(:get).and_return(xml)
      @result = AAWS::Item.search(:title => 'Harry Potter')
      @item = @result.items.first
    end
    
    it "should have asin" do
      @item.asin.should == '0545010225'
    end
    
    it "should have url" do
      @item.url.should == 'http://www.amazon.com/gp/redirect.html%3FASIN=0545010225%26tag=ws%26lcode=xm2%26cID=2025%26ccmID=165953%26location=/Harry-Potter-Deathly-Hallows-Book/dp/0545010225%253FSubscriptionId=13BGQE8Q6AKCRYPHG0G2'
    end
    
    it "should have author" do
      @item.author.should == 'J. K. Rowling'
    end
    
    it "should have creator" do
      @item.creator.should == 'Mary GrandPr\303\251'
    end
    
    it "should have manufacturer" do
      @item.manufacturer.should == 'Arthur A. Levine Books'
    end
    
    it "should have product_group" do
      @item.product_group.should == 'Book'
    end
    
    it "should have title" do
      @item.title.should == 'Harry Potter and the Deathly Hallows (Book 7)'
    end
  end  
end