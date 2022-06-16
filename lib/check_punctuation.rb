def check_punctuation(text)
  if text == ""
    fail "Empty string"
  end
  
  if text[0].upcase == text[0] && text[-1].match?(/[.!?]/)
    return true
  else
    return false
  end
end