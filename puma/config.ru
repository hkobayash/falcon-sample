# frozen_string_literal: true

require 'net/http'
require 'sinatra/base'

class MyApp < Sinatra::Base
  get '/' do
    uri = URI.parse('https://raksul.com/')

    Net::HTTP.get(uri)
  end

  get '/sleep' do
    sleep(1)

    'Wake Up!'
  end
end

use MyApp

run lambda {|env| [404, {}, []]}
