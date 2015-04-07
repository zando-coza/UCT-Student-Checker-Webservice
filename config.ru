require 'rubygems'
require 'bundler/setup'
require 'peoplesoft_scraper'
require 'sinatra'
require 'json'
require './main.rb'

set :environment, :production
set :run, false
set :raise_errors, true

run Sinatra::Application