class Jeu
  def initialize(mise_depart)
    @joueur = Joueur.new(mise_depart)
    @roulette = Roulette.new
    boucle
  end

  def tour
    puts "###### NOUVEAU TOUR #######"
    misej   = @joueur.demande_mise
    numeroj = @joueur.choisi_numéro
    @roulette.lancer!

    puts "--> Numéro tiré :   #{@roulette.numero}"
    puts "--> Couleur tirée : #{@roulette.couleur}"

    if numeroj == @roulette.numero
      puts "--> Joueur gagne #{4 * misej}"
      @joueur.gagne(4 * misej)
    elsif Roulette.couleur(numeroj) == @roulette.couleur
      puts "--> Joueur gagne #{1.5 * misej}"
      @joueur.gagne(1.5 * misej)
    end
  end

  def boucle
    until @joueur.cagnotte_vide?
      tour
    end
  end
end
