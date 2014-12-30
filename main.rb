require 'sinatra'

get '/student/:studentnumber' do
  # Send the student number through to the existing peopleSoft parser
  "Hello #{params[:studentnumber]}!"
end