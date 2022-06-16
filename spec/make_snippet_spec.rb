require "make_snippet"

RSpec.describe "make_snippet" do

  it "returns the same string when input is 5 words or fewer" do
    expect( make_snippet("Walk the dog with Hannah") ).to eq "Walk the dog with Hannah"
  end

  it "returns truncated string when input is more than 5 words" do
    expect( make_snippet("Makers Daily Peer Group Check In") ).to eq "Makers Daily Peer Group Check..."
  end

end