class Roulette
  attr_reader :numero

  def lancer!
    @numero = rand(49)
  end

  def couleur
    @numero.even? ? :noir : :rouge
  end
end