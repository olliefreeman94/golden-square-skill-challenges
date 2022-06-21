class Diary
  def initialize
    @entries = []
  end

  def add(entry)
    @entries << entry
  end

  def all
    return @entries
  end

  def count_words
    return @entries.sum { |entry| entry.count_words }
  end

  def reading_time(wpm)
    fail "Reading speed must be greater than zero." if wpm <= 0
    return (count_words.to_f / wpm).ceil
  end

  def find_best_entry_for_reading_time(wpm, minutes)
    fail "Reading speed and minutes must be greater than zero." if wpm <= 0 || minutes <= 0
    readable_words = wpm * minutes
    current_entry = nil
    current_length = 0
    @entries.each do |entry|
      word_count = entry.count_words
      if word_count <= readable_words && word_count > current_length
        current_entry = entry
        current_length = word_count
      end
    end
    return current_entry
  end
end