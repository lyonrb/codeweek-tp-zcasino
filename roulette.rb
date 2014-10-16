class Roulette
  def lancer!
    @numero = rand(49)
  end

  def numero
    @numero
  end

  def couleur
    if @numero.even?
      :noir
    else
      :rouge
    end
  end
end
