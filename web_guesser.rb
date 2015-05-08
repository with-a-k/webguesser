require 'sinatra'
require 'sinatra/reloader'

var = rand(101)

get '/' do
  "The secret number is: #{var}"
end