get '/student/:studentnumber' do
  content_type :json
  # Send the student number through to the existing peopleSoft parser
  studentNumber =params[:studentnumber]
  begin
    # Initialize the Object
    o = PeoplesoftScraper.retrieve(studentNumber)

   # Defensiveness if the students terms aren't accessible due to unpaid fees etc.
    if o[:terms].first.nil? then
      # set status code to not found
      status 404
      # build response
      return 'false'
    end

    # Get the most recent year of results
    recentYearResults = o[:terms].first

    # Get the most recent year
    mostRecentYear = recentYearResults[:year]

    # Get the current year
    time = Time.new
    currentYear = time.year

    # Check if the student is registered for the current year
    if mostRecentYear == currentYear then

      # set a OK status code
      status 200
      studentName = o[:student_name]

      # build response
      'true'
    else

      # set status code to not found
      status 404

      # build response
      'false'
    end

      # handle exception
  rescue Exception => e

    # set status code to not found
    status 404

    # build response
    'false'
  end
end
