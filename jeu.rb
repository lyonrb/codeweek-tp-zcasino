
class Jeu

  def initialize (mise_depart)
    @joueur = Joueur.new mise_depart   
    @roulette = Roulette.new  
    boucle 
    
  end
  
  def tour 
    numeroj = @joueur.choose_number
    @roulette.lancer! 

    if numeroj == @roulette.numero 
      @joueur.add_cagnotte @joueur.mise*4 
    elsif Roulette.couleur numeroj == @roulette.couleur 
      @joueur.add_cagnotte @joueur.mise*1.5   
    else
      @joueur.add_cagnotte -@joueur.mise 
    end
  end

  def boucle 
    until @joueur.peutjouer == false  
      tour
    end 

  end

end