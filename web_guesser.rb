require 'sinatra'
require 'sinatra/reloader'

var = rand(101)
message = "Give it a try."
counter = 0

get '/' do
  if params['guess'].to_i > var + 5
    message = "It's much too high."
    color = 'red'
    counter += 1
  elsif params['guess'].to_i < var - 5
    message = "It's much too low."
    color = 'red'
    counter += 1
  elsif params['guess'].to_i > var
    message = "It's too high."
    color = 'salmon'
    counter += 1
  elsif params['guess'].to_i < var
    message = "It's too low."
    color = 'salmon'
    counter += 1
  elsif params['guess'].to_i == var
    message = "The secret number is #{var}. It's been changed."
    color = 'green'
    var = rand(101)
    counter = 0
  end
  if counter > 4
    message = "You're out of tries. The number has changed."
    color = "rgb(150,150,255)"
    var = rand(101)
    counter = 0
  end
  if params["cheat"] == "true"
    message += "\nThe number is #{var}. Tell no one."
  end
  erb :index, :locals => {:number => var,
                          :message => message,
                          :color => color}
end