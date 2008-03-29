require File.dirname(__FILE__) + '/spec_helper.rb'

describe AAWS::Item do
  it "should have operation default param" do
    AAWS::Item.default_params.has_key?(:operation).should == true
  end
end