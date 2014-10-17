class Roulette
  attr_reader :numero

  def lancer!
    @numero = rand(49)
  end

  def couleur
    if @numero == 0
      :vert
    else
      @numero.even? ? :noir : :rouge
    end
  end

  def self.couleur(numero)
    if numero == 0
      :vert
    else
      numero.even? ? :noir : :rouge
    end
  end
end
