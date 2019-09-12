require 'sinatra'
require 'sinatra/activerecord'
require 'twilio-ruby'
require './models/incoming_text'
require './models/export_message'
require 'pry'

class App < Sinatra::Base

  get "/" do
    content_type :json
    IncomingText.all.to_json
  end

  post '/sms' do
    twiml = Twilio::TwiML::MessagingResponse.new do |r|

          denver_zipcodes = Array.new([80014, 80019, 80022, 80110, 80123, 80201, 80202, 80203, 80204, 80205, 80206, 80207, 80208, 80209, 80210, 80211, 80212, 80216, 80217, 80218, 80219, 80220, 80221, 80222, 80223, 80224, 80227, 80230, 80231, 80235, 80236, 80237, 80238, 80239, 80243, 80244])

          body = params['Body']
          from = params['From']

      if  denver_zipcodes.include?(body.to_i)
        export = ExportMessage.new(body, from)
         json = export.send
         info = export.get_json(json)
         name = []
         address = []
         number = []
         shelters = info[:data].map do |shelter|
           name << shelter[:attributes][:name]
           address << shelter[:attributes][:address]
           number << shelter[:attributes][:phone_number]
         end

        r.message(body: "\n\nName: #{name.first}\n\nAddresss: #{address.first}\n\nPhone: #{number.first}\n\n\nName: #{name[1]}\nAddresss: #{address[1]}\n\nPhone: #{number[1]}")

      else
        r.message(body: 'Invalid ZipCode. Please Enter a 5 digit Zipcode')
      end
    end
    content_type 'text/xml'
    twiml.to_s
  end
end
