
require 'open-uri'
require 'nokogiri'
require 'json'
# require 'csv'
require 'google_drive'
require 'pry'
require 'rubygems'

require 'bundler'
Bundler.require

require_relative 'lib/app/department'
# require_relative 'lib/app/email_sender'

valdoise = Department.new("Emails du val d'Oise" , "http://annuaire-des-mairies.com/val-d-oise.html" )

#valdoise.save_as_JSON

#valdoise.save_as_spreadsheet

#valdoise.save_as_csv

