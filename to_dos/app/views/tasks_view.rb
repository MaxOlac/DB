class TasksView
# Recuerda que la única responsabilidad de la vista es desplegar data al usuario

	def index(thing,status)
    for i in 0..thing.size-1
      if status[i]
      print "#{i+1}. #{thing[i]} [x]\n"
      else
        print "#{i+1}. #{thing[i]} [ ]\n"
      end
    end
  end

  def add(string)
    print "You succesfully added '#{string}' to your tasks\n"
  end

  def delete(string)
  print "You succesfully deleted '#{string}' of your tasks\n"
  end

  def complete(string)
    print "You succesfully completed '#{string}' of your tasks\n"
  end

	def error
    p "Error"
	end
end
