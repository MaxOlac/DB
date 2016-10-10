Lapdistance = 100
#RaceCar class
class RaceCar
  attr_reader :name
  def initialize(name,times=[])
    @name = name
    @times = times
  end

  #método para obtener velocidad promedio
  def average_speed
    average=0
    @times.each do |time|
      average+=time
    end
    (Lapdistance/(average.to_f/5)).round(2)
  end

  #método que muestra nivel de cada race car
  def level
    average=average_speed
       if average < 5
        "Principiante"
      elsif average < 10
        "Normal"
      elsif average < 15
        "Medio"
      else
        "Avanzado"
      end
  end

end

#Team class
class Team 
  attr_reader :team
  def initialize(team=[])
    @team=team
  end
  #método para agregar nuevo race car
  def new_recer(car)
    @team<<car
  end

  #método para calcular promedio de velocidad del equipo
  def average_speed_of_team
    if @team.empty?
      0
    else
      team_average=[0,0]
      @team.each do |car|
        team_average[0]+=car.average_speed
        team_average[1]+=1
      end
      (team_average[0]/team_average[1]).round(2)
    end
  end

end

#método para buscar race car
def search(name,team)
  res = "#{name} is not a racer" 
  team.team.each do |car|
    res ="#{name} is a racer" if car.name == name
  end
  res
end

#método para mostrar nombre y nivel del race car
def cars(team)
  puts "\n"
  puts "    NAME    |   LEVEL    "
  puts "-----------------------"
  team.team.each do |car|
    puts "  #{car.name }       #{car.level}"
  end
end


#instancias de RaceCar
car1 = RaceCar.new('Force',[5,7,9,10,11])
car2 = RaceCar.new('Power',[11,9,7.5,8.5,11.2,10.1])
car3 = RaceCar.new('Passwater',[13,13,12.3,15,16])
car4 = RaceCar.new('Banjo',[9,11,10,10,16])
car5 = RaceCar.new('Duck',[4,4,7,10,6])





#tests

p "car1: #{car1.average_speed} m/s"
#ej. car1: 9.5 m/s
p "car2: #{car2.average_speed} m/s"
#ej. car2: 12.01 m/s
p "car3: #{car3.average_speed} m/s"
#ej. car3: 10.65 m/s
p "car4: #{car4.average_speed} m/s"
#ej. car4: 11.0 m/s
p "car5: #{car5.average_speed} m/s"
#ej. car5: 10.15 m/s


#create a team of cars 
team1 = [car1, car2, car3, car4, car5]
team_one = Team.new(team1)

#test para buscar race car en equipo team_one
p search("Power", team_one) #== "Power is a racer"

#calculate average speed of team
p team_one.average_speed_of_team
#ej. 10.66 

#método para mostrar nombre y nivel del race car
cars(team_one)