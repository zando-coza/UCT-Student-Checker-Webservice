require 'peoplesoft_scraper'
require 'sinatra'

set :server, 'webrick'


get '/student/:studentnumber' do
  # Send the student number through to the existing peopleSoft parser
  studentNumber =params[:studentnumber]
  begin
    o = PeoplesoftScraper.retrieve(studentNumber)
    recentYearResults = o[:terms].first
     mostRecentYear = recentYearResults[:year]
     puts mostRecentYear
     "Student Name: #{o[:student_name]} #{o[:terms]}"

  rescue Exception => e

  end
end
