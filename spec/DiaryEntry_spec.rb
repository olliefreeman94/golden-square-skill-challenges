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

  describe "count_words" do
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
  end

  describe "reading_time" do
    context "given varying reading speeds, returns appropriate reading time for given contents" do
      it "returns 1 for reading speed 200 wpm, word count 100" do
        entry = DiaryEntry.new("meeting", "notes " * 100)
        expect( entry.reading_time(200) ).to eq 1
      end

      it "returns 5 for reading speed 200 wpm, word count 1000" do
        entry = DiaryEntry.new("meeting", "notes " * 1000)
        expect( entry.reading_time(200) ).to eq 5
      end

      it "returns an error for a given reading speed of 0" do
        entry = DiaryEntry.new("meeting", "notes")
        expect{ entry.reading_time(0) }.to raise_error "Reading speed must be greater than zero."
      end
    end
  end

  describe "reading_chunk" do
    context "given varying reading speeds and time available, returns correct chunk for given contents" do
      it "returns entire contents if readable in time available" do
        entry = DiaryEntry.new("meeting", "one two")
        expect( entry.reading_chunk(2, 1) ).to eq "one two"
      end

      it "returns readable chunk if contents not readable in time available" do
        entry = DiaryEntry.new("meeting", "one two three")
        expect( entry.reading_chunk(2, 1) ).to eq "one two"
      end
    end

    context "when reading_chunk has previously been called, given varying reading speeds and time available, returns correct chunk for given contents" do
      it "still returns the entire contents if readable in time available" do
        entry = DiaryEntry.new("meeting", "one two")
        entry.reading_chunk(2, 1)
        expect( entry.reading_chunk(2, 1) ).to eq "one two"
      end

      it "returns next chunk of contents" do
        entry = DiaryEntry.new("meeting", "one two three four five")
        entry.reading_chunk(2, 1)
        expect( entry.reading_chunk(2, 1) ).to eq "three four"
      end

      it "returns final chunk of contents" do
        entry = DiaryEntry.new("meeting", "one two three four five")
        entry.reading_chunk(2, 1)
        entry.reading_chunk(2, 1)
        expect( entry.reading_chunk(2, 1) ).to eq "five"
      end
    end

    it "returns first chunk again after entire contents has been cycled" do
      entry = DiaryEntry.new("meeting", "one two three four five")
      entry.reading_chunk(2, 1)
      entry.reading_chunk(2, 1)
      entry.reading_chunk(2, 1)
      expect( entry.reading_chunk(2, 1) ).to eq "one two"
    end

    it "returns an error for a given reading speed of 0" do
      entry = DiaryEntry.new("meeting", "notes")
      expect{ entry.reading_chunk(0, 1) }.to raise_error "Reading speed and minutes must be greater than zero."
    end

    it "returns an error for given minutes of 0" do
      entry = DiaryEntry.new("meeting", "notes")
      expect{ entry.reading_chunk(200, 0) }.to raise_error "Reading speed and minutes must be greater than zero."
    end
  end
end