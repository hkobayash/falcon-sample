# frozen_string_literal: true

require 'sinatra/base'

class MyApp < Sinatra::Base
  get '/' do
    body = Async::HTTP::Body::Writable.new

    Async::Task.current.async do |task|
      endpoint = Async::HTTP::URLEndpoint.parse('https://raksul.com')
      client = Async::HTTP::Client.new(endpoint)
      response = client.get('/')
      body.write(response.read)
    ensure
      client.close
      body.close
    end

    body
  end
end

use MyApp

run lambda {|env| [404, {}, []]}
