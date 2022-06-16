def identify_todo(text)
  if text == ""
    fail "Empty string"
  elsif text == "#TODO"
    fail "Missing information about task"
  end
  
  if text.include?("#TODO")
    return true
  else
    return false
  end
end