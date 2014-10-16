
class Jeu

  def initialize(mise_depart)
    @joueur = Joueur.new mise_depart   
    @roulette = Roulette.new  
    boucle 
  end
  
  def tour
    mise = @joueur.demande_mise
    numeroj = @joueur.choisi_numéro
    @roulette.lancer! 

    if numeroj == @roulette.numero 
      @joueur.gagne mise*4 
    elsif Roulette.couleur numeroj == @roulette.couleur 
      @joueur.gagne mise*1.5   
    end
  end

  def boucle 
    until @joueur.cagnotte_vide?  
      tour
    end 
  end

end
