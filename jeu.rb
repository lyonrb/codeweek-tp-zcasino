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
    lancer_la_bille!
    resoudre_les_mises!(misej, numeroj)
  end

  def boucle
    tour until @joueur.cagnotte_vide?
    puts "Vous êtes lessivé ! Sortez de mon casino !"
  end

private

  def lancer_la_bille!
    @roulette.lancer!
    puts "--> Numéro tiré :   #{@roulette.numero}"
    puts "--> Couleur tirée : #{@roulette.couleur}"
  end
  
  def resoudre_les_mises!(misej, numeroj)
    if @roulette.numero == 0
      joueur_gagne(36 * misej)
    elsif @roulette.numero == numeroj
      joueur_gagne(4 * misej)
    elsif @roulette.couleur == Roulette.couleur(numeroj)
      joueur_gagne(1.5 * misej)
    else
      puts "--> Vous avez lamentablement perdu"
    end 
  end
    
  def joueur_gagne(pactole)
    puts "--> Joueur gagne #{pactole}"
    @joueur.gagne(pactole)
  end
end
