require "Todo"

RSpec.describe Todo do
  describe "#task" do
    it "returns added task" do
      task = Todo.new("Walk the dog")
      expect( task.task ).to eq "Walk the dog"
    end
  end

  describe "#done?" do
    it "returns false for incomplete task" do
      task = Todo.new("Walk the dog")
      expect( task.done? ).to eq false
    end

    it "returns true for complete task" do
      task = Todo.new("Walk the dog")
      task.mark_done!
      expect( task.done? ).to eq true
    end
  end
end