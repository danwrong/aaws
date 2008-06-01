require File.dirname(__FILE__) + '/spec_helper.rb'

describe AAWS::Book do
  it "should have search_index default param" do
    AAWS::Book.default_params.has_key?(:search_index).should == true
  end
  
  # TODO: implement this after item search works
  # it "should return a collection of book objects when searching" do
  #   AAWS::Base.establish_connection('blah')
  #   xml = open(File.dirname(__FILE__) + '/fixtures/book_search_ruby_on_rails.xml').read
  #   AAWS::Connection.should_receive(:get).and_return(xml)
  #   books = AAWS::Book.search(:title => 'Ruby on Rails')
  #   
  # end
end