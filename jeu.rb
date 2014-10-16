require './roulette.rb'

roulette = Roulette.new

roulette.lancer!
numero_tire   = roulette.numero
couleur_tiree = roulette.couleur

puts numero_tire
puts couleur_tiree
