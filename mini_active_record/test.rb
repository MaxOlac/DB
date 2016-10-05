require_relative 'app'

def assert(truthy)
  raise "Tests failed" unless truthy
end


chef = Chef.create(first_name: "Eduardo", last_name: "Fernández", email:"eduardo@gmail.com", phone:"930-028-2908 x7555",
                          birthday:Time.now)
#chef = Chef.find(1)
meal = Meal.create(name: 'Lasaña',chef_id: 1 )


assert chef[:first_name] == 'Eduardo'
assert chef[:last_name] == 'Fernández'
chef[:first_name] = 'Hector'
assert chef[:first_name] == 'Hector'
p "="*70
p Chef.all
p "="*70
p Meal.all

puts "finished"
