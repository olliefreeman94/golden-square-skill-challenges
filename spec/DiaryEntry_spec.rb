require "DiaryEntry"

RSpec.describe DiaryEntry do
  it "returns title for a given diary entry" do
    entry = DiaryEntry.new("meeting", "notes")
    expect( entry.title ).to eq "meeting"
  end

  it "returns contents for a given diary entry" do
    entry = DiaryEntry.new("meeting", "notes")
    expect( entry.contents ).to eq "notes"
  end

  context "given diary entries with contents of varying length" do
    it "returns word count zero when contents is an empty string" do
      entry = DiaryEntry.new("meeting", "")
      expect( entry.count_words ).to eq 0
    end

    it "returns word count one when contents is a one word string" do
      entry = DiaryEntry.new("meeting", "notes")
      expect( entry.count_words ).to eq 1
    end

    it "returns correct word count when contents is multi word string" do
      entry = DiaryEntry.new("meeting", "notes " * 10)
      expect( entry.count_words ).to eq 10
    end
  end

  context "given varying reading speeds, returns appropriate reading time for given contents" do
    it "returns 1 for reading speed 200 wpm, word count 100" do
      entry = DiaryEntry.new("meeting", "notes " * 100)
      expect( entry.reading_time(200) ).to eq 1
    end

    it "returns 5 for reading speed 200 wpm, word count 1000" do
      entry = DiaryEntry.new("meeting", "notes " * 1000)
      expect( entry.reading_time(200) ).to eq 5
    end
  end

  context "given varying reading speeds and time available, returns correct chunk for given contents" do
    it "returns entire contents if readable in time available" do
      entry = DiaryEntry.new("meeting", "notes" + " notes" * 149)
      expect( entry.reading_chunk(200, 1) ).to eq "notes" + " notes" * 149
    end

    it "returns readable chunk if contents not readable in time available" do
      entry = DiaryEntry.new("meeting", "notes" + " notes" * 349)
      expect( entry.reading_chunk(200, 1) ).to eq "notes" + " notes" * 199
    end
  end

  context "when reading_chunk has previously been called, given varying reading speeds and time available, returns correct chunk for given contents" do
    it "still returns the entire contents if readable in time available" do
      entry = DiaryEntry.new("meeting", "notes" + " notes" * 149)
      entry.reading_chunk(200, 1)
      expect( entry.reading_chunk(200, 1) ).to eq "notes" + " notes" * 149
    end

    it "returns next chunk of contents" do
      entry = DiaryEntry.new("meeting", "notes" + " notes" * 199 + " *notes" * 250)
      entry.reading_chunk(200, 1)
      expect( entry.reading_chunk(200, 1) ).to eq "*notes" + " *notes" * 199
    end

    it "returns final chunk of contents" do
      entry = DiaryEntry.new("meeting", "notes" + " notes" * 199 + " *notes" * 200 + " -notes" * 150)
      entry.reading_chunk(200, 1)
      entry.reading_chunk(200, 1)
      expect( entry.reading_chunk(200, 1) ).to eq "-notes" + " -notes" * 149
    end
  end

  it "returns first chunk again after entire contents has been cycled" do
    entry = DiaryEntry.new("meeting", "notes" + " notes" * 199 + " *notes" * 200 + " -notes" * 150)
    entry.reading_chunk(200, 1)
    entry.reading_chunk(200, 1)
    entry.reading_chunk(200, 1)
    expect( entry.reading_chunk(200, 1) ).to eq "notes" + " notes" * 199
  end
end