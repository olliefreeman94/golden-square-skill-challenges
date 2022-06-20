class ToDoManager
  def initialize
    @todos = {}
  end
  
  def add_todo(task)
    fail "No task provided." if task == ""
    fail "Duplicate task provided." if @todos.keys.include?(task)
    @todos[task] = {}
    @todos[task]["status"] = "incomplete"
  end

  def list_todos
    incomplete_todos = @todos.select { |key, value| value["status"] == "incomplete" }.keys
    return "No outstanding todos." if incomplete_todos.length == 0
    return incomplete_todos
  end

  def complete_todo(task)
    fail "No task provided." if task == ""
    if @todos.keys.include?(task)
      @todos[task]["status"] = "complete"
    else
      fail "Task not found."
    end
  end
end