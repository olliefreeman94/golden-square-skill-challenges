class DiaryEntry
  def initialize(title, contents)
    @title = title
    @contents = contents
    @next_index = 0
  end

  def title
    return @title
  end

  def contents
    return @contents
  end

  def count_words
    return words.length
  end

  def reading_time(wpm)
    if wpm <= 0
      fail "Reading speed must be greater than zero."
    end
    word_count = count_words
    return (word_count.to_f / wpm).ceil
  end

  def reading_chunk(wpm, minutes)
    if wpm <= 0 || minutes <= 0
      fail "Reading speed and minutes must be greater than zero."
    end
    readable_words = wpm * minutes

    if readable_words >= words.length - @next_index
      chunk = words[@next_index...words.length]
      @next_index = 0
      return chunk.join(" ")
    else
      chunk = words[@next_index...@next_index + readable_words]
      @next_index += readable_words
      return chunk.join(" ")
    end
  end

  private
  
  def words
    return @contents.split(" ")
  end
end