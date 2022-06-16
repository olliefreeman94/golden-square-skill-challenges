require "check_punctuation"

RSpec.describe "check_punctuation method" do
  it "returns an error when passed an empty string" do
    expect{ check_punctuation("") }.to raise_error "Empty string"
  end

  it "returns true when passed a correctly formatted string" do
    expect( check_punctuation("Hello world.") ).to eq true
  end

  it "returns false when passed a string without initial capital letter or closing punctuation" do
    expect( check_punctuation("hello world") ).to eq false
  end

  it "returns false when passed a string without closing punctuation" do
    expect( check_punctuation("Hello world") ).to eq false
  end

  it "returns false when passed a string without initial capital letter" do
    expect( check_punctuation("hello world.") ).to eq false
  end

end