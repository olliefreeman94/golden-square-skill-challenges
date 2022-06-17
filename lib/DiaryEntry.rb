class DiaryEntry
  def initialize(title, contents)
    @title = title
    @contents = contents
    @next_word = 0
  end

  def title
    return @title
  end

  def contents
    return @contents
  end

  def count_words
    words = @contents.split(" ")
    return words.length
  end

  def reading_time(wpm)
    word_count = count_words
    return (word_count.to_f / wpm).ceil
  end

  def reading_chunk(wpm, minutes)
    total_time = reading_time(wpm)
    if total_time <= minutes
      return @contents
    end

    word_count = count_words
    words = @contents.split(" ")
    readable_words = wpm * minutes
    if @next_word == 0
      chunk = words[0..readable_words - 1]
      @next_word += chunk.length
      return chunk.join(" ")
    elsif @next_word + readable_words < word_count
      chunk = words[@next_word..(@next_word + readable_words - 1)]
      @next_word += chunk.length
      return chunk.join(" ")
    else
      chunk = words[@next_word..word_count - 1]
      @next_word = 0
      return chunk.join(" ")
    end
  end
end