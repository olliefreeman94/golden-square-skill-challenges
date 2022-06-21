require "Diary"
require "DiaryEntry"

RSpec.describe "diary_integration" do
  context "when diary entries have been added" do
    it "returns list of entries" do
      diary = Diary.new
      entry1 = DiaryEntry.new("meeting1", "notes1")
      entry2 = DiaryEntry.new("meeting2", "notes2")
      diary.add(entry1)
      diary.add(entry2)
      expect( diary.all ).to eq [entry1, entry2]
    end

    it "returns correct total word count" do
      diary = Diary.new
      entry1 = DiaryEntry.new("meeting1", "notes1 " * 50)
      entry2 = DiaryEntry.new("meeting2", "notes2 " * 100)
      diary.add(entry1)
      diary.add(entry2)
      expect( diary.count_words ).to eq 150
    end

    it "returns correct total reading time" do
      diary = Diary.new
      entry1 = DiaryEntry.new("meeting1", "notes1 " * 50)
      entry2 = DiaryEntry.new("meeting2", "notes2 " * 100)
      diary.add(entry1)
      diary.add(entry2)
      expect( diary.reading_time(200) ).to eq 1
    end

    it "returns appropriare entry for given reading speed and minutes" do
      diary = Diary.new
      entry1 = DiaryEntry.new("meeting1", "one")
      entry2 = DiaryEntry.new("meeting2", "one two three")
      entry3 = DiaryEntry.new("meeting3", "one two three four five")
      diary.add(entry1)
      diary.add(entry2)
      diary.add(entry3)
      expect( diary.find_best_entry_for_reading_time(2, 2) ).to eq entry2
    end

    it "returns nil if no readable entry found" do
      diary = Diary.new
      entry1 = DiaryEntry.new("meeting2", "one two three")
      entry2 = DiaryEntry.new("meeting3", "one two three four five")
      diary.add(entry1)
      diary.add(entry2)
      expect( diary.find_best_entry_for_reading_time(2, 1) ).to eq nil
    end
  end
end