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
    if @roulette.numero == 0
      puts "--> Joueur gagne #{36 * misej}"
      @joueur.gagne(36 * misej)
    elsif @roulette.numero == numeroj
      puts "--> Joueur gagne #{4 * misej}"
      @joueur.gagne(4 * misej)
    elsif @roulette.couleur == Roulette.couleur(numeroj)
      puts "--> Joueur gagne #{1.5 * misej}"
      @joueur.gagne(1.5 * misej)
    else
      puts "--> Vous avez lamentablement perdu"
    end
  end

  def boucle
    until @joueur.cagnotte_vide?
      tour
    end
  end
end
