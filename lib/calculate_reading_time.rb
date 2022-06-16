def calculate_reading_time(text)
  if text == ""
    fail "Empty string"
  end

  words = text.split(" ")
  if words.length > 0 && words.length < 201
    return "1 minute"
  elsif
    time = words.length.to_f / 200
    return "#{time.ceil} minutes"
  end
end