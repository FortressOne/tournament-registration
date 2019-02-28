#!/usr/bin/env ruby

require 'elo'
require 'pry'

Elo.configure do |config|
  config.default_rating = 1000
  config.pro_rating_boundry = 2400
  config.starter_boundry = 30
end

teams = {}

%w[sobar charming ragtag chiken penguin].each do |team|
  teams[team] = Elo::Player.new
end

teams["sobar"].wins_from(teams["penguin"])
teams["charming"].wins_from(teams["chiken"])
teams["charming"].wins_from(teams["sobar"])
teams["ragtag"].wins_from(teams["chiken"])
teams["ragtag"].wins_from(teams["penguin"])
teams["sobar"].wins_from(teams["chiken"])
teams["ragtag"].wins_from(teams["sobar"])
teams["charming"].wins_from(teams["penguin"])
teams["chiken"].wins_from(teams["penguin"])
teams["charming"].wins_from(teams["ragtag"])
teams["charming"].wins_from(teams["ragtag"])
teams["sobar"].wins_from(teams["ragtag"])

results = teams.map do |name, elo|
  {name => elo.rating}
end

puts results
