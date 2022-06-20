require "GrammarStats"

RSpec.describe GrammarStats do
  describe "check" do
    it "returns an error when passed an empty string" do
      grammar_stats = GrammarStats.new
      expect{ grammar_stats.check("") }.to raise_error "Empty string."
    end

    it "returns true when passed correctly formatted text" do
      grammar_stats = GrammarStats.new
      expect( grammar_stats.check("Hello world.") ).to eq true
    end

    it "returns false when passed incorrectly formatted text" do
      grammar_stats = GrammarStats.new
      expect( grammar_stats.check("hello world") ).to eq false
    end

    it "returns false when passed partially incorrectly formatted text" do
      grammar_stats = GrammarStats.new
      expect( grammar_stats.check("Hello world") ).to eq false
      expect( grammar_stats.check("hello world.") ).to eq false
    end
  end

  describe "percentage_good" do
    it "returns 100 when all texts have passed checks" do
      grammar_stats = GrammarStats.new
      grammar_stats.check("Hello world.")
      grammar_stats.check("Hello world.")
      expect(grammar_stats.percentage_good).to eq 100
    end

    it "returns 0 when all texts have failed checks" do
      grammar_stats = GrammarStats.new
      grammar_stats.check("hello world")
      grammar_stats.check("hello world")
      expect(grammar_stats.percentage_good).to eq 0
    end

    it "returns correct percentage when some texts have passed checks" do
      grammar_stats = GrammarStats.new
      grammar_stats.check("Hello world.")
      grammar_stats.check("Hello world.")
      grammar_stats.check("hello world")
      expect(grammar_stats.percentage_good).to eq 67
    end

    it "retuns an error if no texts have been checked" do
      grammar_stats = GrammarStats.new
      expect{ grammar_stats.percentage_good }.to raise_error "No texts checked."
    end
  end
end