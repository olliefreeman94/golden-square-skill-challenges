require "TodoList"

RSpec.describe TodoList do
  context "when no tasks have been added" do
    it "returns an empty list" do
      list = TodoList.new
      expect( list.incomplete ).to eq []
      expect( list.complete ).to eq []
    end

    it "returns an error when marking all tasks as done" do
      list = TodoList.new
      expect{ list.give_up! }.to raise_error "No tasks added."
    end
  end
end