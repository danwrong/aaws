require File.dirname(__FILE__) + '/spec_helper.rb'

describe AAWS::Base do
  it "should require access key to establish connection" do
    lambda { AAWS::Base.establish_connection('') }.should raise_error(ArgumentError)
  end
  
  it "should be able to establish connection" do
    AAWS::Base.establish_connection('jibberish')
  end
  
  it "should have default params with service" do
    AAWS::Base.default_params.has_key?(:service).should == true
  end
  
  it "should be able to make get requests" do
    AAWS::Base.should_receive(:get).and_return('got r dun')
    AAWS::Base.get(:foo => 'bar').should == 'got r dun'
  end
  
  it "should raise connection error if access key is not set and request is attempted"
end