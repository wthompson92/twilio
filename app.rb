require 'sinatra'
require 'sinatra/activerecord'
require 'twilio-ruby'


require 'pry'
class App < Sinatra::Base
  get "/" do
    "Hello world!"
  end
  #
  get "/api/phone_numbers/all" do
    content_type :json

    require './models/phone_number'
    PhoneNumber.all.to_json
  end

  post '/sms' do
    twiml = Twilio::TwiML::MessagingResponse.new do |r|
    r.message(body: 'Thanks for signing up.')
    end
    content_type 'text/xml'
    twiml.to_s
  end
end
