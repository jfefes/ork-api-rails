Rails.application.routes.draw do

  root 'ork#login'

  post 'send_credit' => 'ork#send_credit'
end
