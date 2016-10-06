class TasksController
  def initialize(args)
    @view = TasksView.new
    cotrol(args)
  end
  def control(option)
    case option
    when "index"
      index
    else
      @view.error
    end
  end
  def index
    task = Task.find(1)
    @view.index(task.task)
  end

  def add
  end

  def delete
  end

  def complete
  end
end
