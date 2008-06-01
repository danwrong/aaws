$:.unshift File.join(File.dirname(__FILE__), '/../lib')
require 'aaws'
require 'yaml'
require 'pp'
config = YAML::load(open(ENV['HOME'] + '/.aaws'))

AAWS::Base.establish_connection(config[:access_key])
pp AAWS::Item.search(:title => 'Harry Potter')
