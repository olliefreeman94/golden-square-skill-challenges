require "Diary"

RSpec.describe Diary do
  context "when no entries have been added" do
    it "returns an empty array" do
      diary = Diary.new
      expect( diary.all ).to eq []
    end

    it "returns a word count of 0" do
      diary = Diary.new
      expect( diary.count_words ).to eq 0
    end

    it "returns a reading time of 0" do
      diary = Diary.new
      expect( diary.reading_time(200) ).to eq 0
    end

    it "returns an error when searching for best entry" do
      diary = Diary.new
      expect{ diary.find_best_entry_for_reading_time(200, 1) }.to raise_error "No entries found."
    end
  end

  it "returns an error for a given reading speed of 0" do
    diary = Diary.new
    expect{ diary.reading_time(0) }.to raise_error "Reading speed must be greater than zero."
  end

  it "returns an error for a given reading speed or minutes of 0" do
    diary = Diary.new
    expect{ diary.find_best_entry_for_reading_time(0, 0) }.to raise_error "Reading speed and minutes must be greater than zero."
    expect{ diary.find_best_entry_for_reading_time(1, 0) }.to raise_error "Reading speed and minutes must be greater than zero."
    expect{ diary.find_best_entry_for_reading_time(0, 1) }.to raise_error "Reading speed and minutes must be greater than zero."
  end
end