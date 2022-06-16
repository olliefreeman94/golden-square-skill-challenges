require "calculate_reading_time"

text201 = "text" + " text" * 200

text801 = "text" + " text" * 800

RSpec.describe "reading_time method" do
  
  it "returns '1 minute' for text between 1-200 words" do
    expect( calculate_reading_time("text") ).to eq "1 minute"
  end

  it "returns '2 minutes' for text between 201-400 words" do
    expect( calculate_reading_time(text201) ).to eq "2 minutes"
  end

  it "returns '5 minutes' for text between 801-1000 words" do
    expect( calculate_reading_time(text801) ).to eq "5 minutes"
  end

  it "returns an error when passed an empty string" do
    expect{ calculate_reading_time("") }.to raise_error "Empty string"
  end

end