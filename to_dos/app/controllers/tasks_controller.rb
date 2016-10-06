class TasksController

  def initialize(args)
    @view = TasksView.new
    @args = args
    control(@args[0])
  end

  def control(option)
    case option
    when "index"
      index
    when "create"
      create
    else
      @view.error
    end
  end

  def index
    todo = Task.pluck(:task)
    @view.index(todo)
  end

  def add
  end

  def delete
  end

  def complete
  end
end
