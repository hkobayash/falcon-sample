# frozen_string_literal: true

require 'sinatra/base'

class MyApp < Sinatra::Base
  get '/' do
    endpoint = Async::HTTP::URLEndpoint.parse('https://raksul.com')
    client = Async::HTTP::Client.new(endpoint)

    response = client.get('/')
    response.read
  ensure
    client.close
  end

  get '/sleep' do
    Async::Task.current.sleep(1)

    'Wake Up!'
  end
end

use MyApp

run lambda {|env| [404, {}, []]}
