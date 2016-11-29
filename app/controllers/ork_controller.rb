class OrkController < ApplicationController
  require 'net/http'
  require 'json'

  def login
  end

  def send_credit
    @username = params[:username]
    @password = params[:password]
    uri = URI("https://amtgard.com/ork/orkservice/Json/index.php?call=Authorization/Authorize&request[UserName]=#{@username}&request[Password]=#{@password}")
    res = Net::HTTP.get_response(uri)
    puts res.body if res.is_a?(Net::HTTPSuccess)

    @token = JSON.parse(res.body)['Token']
    @user = JSON.parse(res.body)['UserId']

    SubmitCreditJob.perform_now(@token, @user)

    render json: res.body
  end
end
