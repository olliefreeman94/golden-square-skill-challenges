class GrammarStats
  def initialize
    @texts_checked = 0
    @texts_passed = 0
  end

  def check(text)
    fail "Empty string." if text == ""
    @texts_checked += 1
    if text[0] == text[0].upcase && text[-1].match?(/[.!?]/)
      @texts_passed += 1
      return true
    else
      return false
    end
  end

  def percentage_good
    fail "No texts checked." if @texts_checked == 0
    return ((@texts_passed.to_f / @texts_checked) * 100).round
  end
end