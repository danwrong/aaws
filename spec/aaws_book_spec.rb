require File.dirname(__FILE__) + '/spec_helper.rb'

describe AAWS::Book do
  it "should have search_index default param" do
    AAWS::Book.default_params.has_key?(:search_index).should == true
  end
  
  it "should return a collection of book objects when searching" do
    AAWS::Book.search(:title => 'Ruby on Rails')
  end
end