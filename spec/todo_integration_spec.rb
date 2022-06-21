require "TodoList"
require "Todo"

RSpec.describe "todo_integration" do
  context "when tasks have been added" do
    it "returns correct complete and incomplete tasks when all marked done" do
      list = TodoList.new
      task1 = Todo.new("Walk the dog")
      task2 = Todo.new("Mow the lawn")
      list.add(task1)
      list.add(task2)
      task1.mark_done!
      task2.mark_done!
      expect( list.incomplete ).to eq []
      expect( list.complete ).to eq [task1, task2]
    end

    it "returns correct complete and incomplete tasks when some marked done" do
      list = TodoList.new
      task1 = Todo.new("Walk the dog")
      task2 = Todo.new("Mow the lawn")
      list.add(task1)
      list.add(task2)
      task2.mark_done!
      expect( list.incomplete ).to eq [task1]
      expect( list.complete ).to eq [task2]
    end

    it "returns correct complete and incomplete tasks when none marked done" do
      list = TodoList.new
      task1 = Todo.new("Walk the dog")
      task2 = Todo.new("Mow the lawn")
      list.add(task1)
      list.add(task2)
      expect( list.incomplete ).to eq [task1, task2]
      expect( list.complete ).to eq []
    end

    it "marks all tasks as done" do
      list = TodoList.new
      task1 = Todo.new("Walk the dog")
      task2 = Todo.new("Mow the lawn")
      list.add(task1)
      list.add(task2)
      list.give_up!
      expect( list.incomplete ).to eq []
      expect( list.complete ).to eq [task1, task2]
    end
  end
end