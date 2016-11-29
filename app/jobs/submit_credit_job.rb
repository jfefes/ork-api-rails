class SubmitCreditJob < ActiveJob::Base
  queue_as :default

  def perform(user, token)
    @token = token
    @user = user
    @credits = ['1', '2', '3']
    @credits.each do |credit|
      uri = URI("https://amtgard.com/ork/orkservice/Json/index.php?call=Attendance/AddAttendance&request[MundaneId]=#{@user}&request[ClassId]=#{credit}&request[Date]=2017-12-#{credit}&request[Credits]=1&request[ParkId]=198&request[KingdomId]=4&request[Token]=#{@token}")
      res = Net::HTTP.get_response(uri)
      puts res.body if res.is_a?(Net::HTTPSuccess)
    end
  end
end
