#Clase CreditCard
class CreditCard
  attr_reader :name,:number,:expiration,:cvc,:status
  attr_writer :status 
  
  def initialize(name,number,expiration,cvc,status)
    @name = name
    @number=number
    @expiration=expiration
    @cvc=cvc
    @status=status
  end
end
#Cinco instancias de CreditCard
#Array con cinco objetos de tarjetas de crédito

datos = [['amex',2345673444,'12/15',2345,[234,567,456,567,344]],
          ['ScotiaBank',2345673744,'12/16 ',2845,[234, 345, 456, 567, 344]],
          ['Bancomer',2345673444,'12/15',2645,[234, 345, 456, 567, 344]],
          ['Serfin',2345473454,'12/20',1345,[234, 345, 456, 567, 344]],
          ['BanCoppel',2345373464,'12/18',2445,[567, 345, 456, 567, 344]]]
cards = []

datos.each do |info|
  cards << CreditCard.new(info[0],info[1],info[2],info[3],info[4])
end
#tests
cards.each do |card|
   puts "#{card.name} responds to:"
   puts "\tName: #{card.respond_to?(:name) == true}"
   puts "\tNumber: #{card.respond_to?(:number) == true}"
   puts "\tExpiration: #{card.respond_to?(:expiration) == true}"
   puts "\tcvc: #{card.respond_to?(:cvc) == true}"
   puts "\tGet status: #{card.respond_to?(:status) == true}"
   puts "\tSet status: #{card.respond_to?(:status=) == true}"
   puts "\n\n"
end
#método para mostrar datos de tarjetas
def datos(cards)
  puts '|     name     |     number     |    expiration  |      cvc      |           status          |'
  puts '----------------------------------------------------------------------------------------------'
  cards.each do |card|
    puts"|     #{card.name}|    #{card.number}  |      #{card.expiration}     |      #{card.cvc}    | #{card.status} |"  
  end
  puts "\n\n"
end
datos(cards)














