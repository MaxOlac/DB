class TasksView
# Recuerda que la única responsabilidad de la vista es desplegar data al usuario

	def index(thing)
    count = 1
    thing.each do |task|
      print "#{count}. #{task}\n"
      count+=1
    end
  end

  def create
  end

  def delete
  end

  def update
  end

	def error
    p "Error"
	end
end
