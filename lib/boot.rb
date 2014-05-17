require 'rubygems'
require 'bundler/setup'

Bundler.require

$:.unshift File.dirname(__FILE__)

autoload :Fetcher, 'fetcher'
autoload :Crawler, 'crawler'
