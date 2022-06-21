class TodoList
  def initialize
    @todos = []
  end

  def add(todo)
    @todos << todo
  end

  def incomplete
    return @todos.select{ |task| task.done? == false }
  end

  def complete
    return @todos.select{ |task| task.done? == true }
  end

  def give_up!
    fail "No tasks added." if @todos.empty?
    @todos.each(&:mark_done!)
  end
end