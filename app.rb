
require 'sinatra'
require 'sinatra/activerecord'
require 'twilio-ruby'
require 'twilio-ruby'
require './models/incoming_text'
require 'pry'

class App < Sinatra::Base
  get "/" do
    "Hello world!"
  end
  #
  get "/api/incoming_texts/all" do
    content_type :json

    IncomingText.all.to_json
  end

  post '/sms' do
    denver_zipcodes = Array.new([80014, 80019, 80022, 80110, 80123, 80201, 80202, 80203, 80204, 80205, 80206, 80207, 80208, 80209, 80210, 80211, 80212, 80216, 80217, 80218, 80219, 80220, 80221, 80222, 80223, 80224, 80227, 80230, 80231, 80235, 80236, 80237, 80238, 80239, 80243, 80244])

    body = params['Body']
    from = params['From']

    twiml = Twilio::TwiML::MessagingResponse.new do |r|
      if  denver_zipcodes.include?(body.to_i)
      IncomingText.create!(phone_number: from, body:body)
      r.message(body: 'Thanks.')

      content_type 'text/xml'
      twiml.to_s

      else
      r.message(body: 'Invalid ZipCode')

      content_type 'text/xml'
      twiml.to_s
      end
    end
  end
end
