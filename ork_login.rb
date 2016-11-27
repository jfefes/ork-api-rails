require 'net/http'
require 'json'

uri = URI('https://amtgard.com/ork/orkservice/Json/index.php?call=Authorization/Authorize&request[UserName]=ritari&request[Password]=zG0ph3rz')
res = Net::HTTP.get_response(uri)
puts res.body if res.is_a?(Net::HTTPSuccess)

@token = JSON.parse(res.body)['Token']

uri = URI("https://amtgard.com/ork/orkservice/Json/index.php?call=Attendance/AddAttendance&request[MundaneId]=54527&request[ClassId]=2&request[Date]=2016-11-26T11:49:59-09:00&request[Credits]=1&request[ParkId]=198&request[KingdomId]=4&request[Token]=#{@token}")
res = Net::HTTP.get_response(uri)
puts res.body if res.is_a?(Net::HTTPSuccess)
