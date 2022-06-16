require "count_words"

RSpec.describe "count_words method" do
  
  context "when given an empty string" do
    it "returns word count 0" do
      expect( count_words("") ).to eq 0
    end
  end

  context "when given one word string" do
    it "returns word count 1" do
      expect( count_words("foo") ).to eq 1
    end
  end

  context "when given multi word string" do
    it "returns word count" do
      expect( count_words("foo bar bat") ).to eq 3
    end
  end

end