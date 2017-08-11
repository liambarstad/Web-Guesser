require 'sinatra'
require 'sinatra/reloader'

SECRET_NUMBER = rand(100)

def high_message(guess)
  if guess.to_i > (SECRET_NUMBER + 5)
    return "Way too high!"
  else
    return "Too high!"
  end
end

def low_message(guess)
  if guess.to_i < (SECRET_NUMBER - 5)
    return "Way too low!"
  else
    return "Too low!"
  end
end

def check_guess(guess)
  if guess.to_i > SECRET_NUMBER
    high_message(guess)
  elsif guess.to_i < SECRET_NUMBER
    low_message(guess)
  elsif guess.to_i == SECRET_NUMBER
    return "You got it right!"
  else
    return ""
  end
end

def secret_message(guess)
  if check_guess(guess) == "You got it right!"
    return "The SECRET NUMBER is #{SECRET_NUMBER}"
  else
    return ""
  end
end

get '/' do
  guess = params["guess"]
  erb :index, :locals => {:guess => guess}
end
