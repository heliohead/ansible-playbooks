require 'sinatra'
require 'pony'
require 'dotenv'

Dotenv.load

get '/' do
  "Hello"
end




