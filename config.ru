# frozen_string_literal: true

require 'faraday'
require 'sinatra/base'

class MyApp < Sinatra::Base
  get "/" do
    response = Faraday.get 'https://raksul.com/'
    response.body
  end
end

use MyApp

run lambda {|env| [404, {}, []]}
