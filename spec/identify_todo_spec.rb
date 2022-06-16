require "identify_todo"

RSpec.describe "identify_todo method" do

  it "returns an error when passed an empty string" do
    expect{ identify_todo("") }.to raise_error "Empty string"
  end

  it "returns an error when passed an incomplete task" do
    expect{ identify_todo("#TODO") }.to raise_error "Missing information about task"
  end

  it "returns true for correctly formatted task, starting with '#TODO'" do
    expect( identify_todo("#TODO Walk the dog") ).to eq true
  end

  it "returns true for correctly formatted task, ending with '#TODO'" do
    expect( identify_todo("Mow the lawn #TODO") ).to eq true
  end  

  it "returns false for string missing '#TODO'" do
    expect( identify_todo("Hello world") ).to eq false
  end 

  it "returns false for string containing '#todo'" do
    expect( identify_todo("#todo") ).to eq false
  end 

end