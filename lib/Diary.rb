class Diary
  def initialize
    @entries = []
  end

  def add(entry) # entry is an instance of DiaryEntry
    # Returns nothing
  end

  def all
    return @entries
  end

  def count_words
    return 0 if @entries == []
  end

  def reading_time(wpm)
    fail "Reading speed must be greater than zero." if wpm <= 0
    return 0 if @entries == []
  end

  def find_best_entry_for_reading_time(wpm, minutes)
    fail "Reading speed and minutes must be greater than zero." if wpm <= 0 || minutes <= 0
    fail "No entries found." if @entries == []
  end
end