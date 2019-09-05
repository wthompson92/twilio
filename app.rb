require 'sinatra'
require 'sinatra/activerecord'
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
end
