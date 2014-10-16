
class Joueur
  def initialize(cagnotte = 10)
    raise "La cagnotte doit être un entier positif" unless positive_integer?(cagnotte)
    @cagnotte = cagnotte
  end
  
  def demande_mise
    puts "Votre cagnotte est de : #{@cagnotte}"
    mise = user_input_positive_integer("Veuillez entrer votre mise :") do |val|
      { problem: (val > @cagnotte), 
        message: "La mise doit être inférieure ou égale à la cagnotte" }
    end
    @cagnotte -= mise
  end
  
  def choisi_numéro
    user_input_positive_integer("Veuillez entrer un numéro entre 0 et 49 :") do |val|
      { problem: !val.between?(0,49), 
        message: "Le numéro doit être compris entre 0 et 49" }
    end
  end
  
  def cagnotte_vide?
    @cagnotte <= 0
  end

  def gagne(pepettes)
    @cagnottes += pepettes
  end
  
  private
  
  def integer(val)
    Integer(val) rescue nil
  end
  
  def positive_integer?(val)
    integer(val) != nil
  end
  
  def user_input_positive_integer(message, &block)
    val = nil
    loop do
      print message
      val = gets.chomp
      
      if positive_integer?(val)
        val = integer(val)
        result = yield val
        if result[:problem] 
          puts result[:message]
        else
          break
        end
      else
        puts "Veuillez entrer un entier positif !"
      end
    end  
    val
  end
  
end

# tests
=begin
j = Joueur.new(10)
mise = j.mise?
num = j.numéro?
puts "mise: #{mise} \t numéro:#{num}"

puts "La cagnotte du joueur est #{j.cagnotte_vide? ? "vide" : "pas vide"}"
=end

