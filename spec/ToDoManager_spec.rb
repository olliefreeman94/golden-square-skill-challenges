require "ToDoManager"

RSpec.describe ToDoManager do
  describe "add_todo" do
    it "returns an error when no task provided" do
      todo_manager = ToDoManager.new
      expect{ todo_manager.add_todo("") }.to raise_error "No task provided."
    end
    
    it "returns an error when duplicate task provided" do
      todo_manager = ToDoManager.new
      todo_manager.add_todo("Walk the dog")
      expect{ todo_manager.add_todo("Walk the dog") }.to raise_error "Duplicate task provided."
    end
  end

  describe "list_todos" do
    context "when todos is empty" do
      it "returns 'No outstanding todos.'" do
        todo_manager = ToDoManager.new
        expect( todo_manager.list_todos ).to eq "No outstanding todos."
      end
    end

    context "when task has been added to todos" do
      it "returns list of tasks" do
        todo_manager = ToDoManager.new
        todo_manager.add_todo("Walk the dog")
        expect( todo_manager.list_todos ).to eq ["Walk the dog"]
      end
    end

    context "when task has been completed" do
      it "returns only incomplete tasks" do
        todo_manager = ToDoManager.new
        todo_manager.add_todo("Walk the dog")
        todo_manager.add_todo("Mow the lawn")
        todo_manager.complete_todo("Walk the dog")
        expect( todo_manager.list_todos ).to eq ["Mow the lawn"]
      end
    end

    context "when all todos have been completed" do
      it "returns 'No outstanding todos.'" do
        todo_manager = ToDoManager.new
        todo_manager.add_todo("Walk the dog")
        todo_manager.complete_todo("Walk the dog")
        expect( todo_manager.list_todos ).to eq "No outstanding todos."
      end
    end
  end

  describe "complete_todo" do
    it "returns an error when no task provided" do
      todo_manager = ToDoManager.new
      todo_manager.add_todo("Walk the dog")
      expect{ todo_manager.complete_todo("") }.to raise_error "No task provided."
    end

    it "returns an error when task missing from todos" do
      todo_manager = ToDoManager.new
      todo_manager.add_todo("Walk the dog")
      expect{ todo_manager.complete_todo("Mow the lawn") }.to raise_error "Task not found."
    end
  end
end