$:.unshift File.dirname(__FILE__)

require 'ostruct'
require 'rubygems'
gem 'activesupport', '>= 2.0.2'
require 'activesupport'
gem 'hpricot', '>= 0.6'
require 'hpricot'
require 'class_level_inheritable_attributes'
require 'aaws/base'
require 'aaws/connection'
require 'aaws/item'
require 'aaws/book'

module AAWS
  class ConnectionError < StandardError; end
end