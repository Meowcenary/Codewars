def score_hand(cards)
  @scores = []
  find_scores(cards, 0)

  # sort the scores and find closest to 21 without going over
  score = @scores.first
  @scores.sort.each do |current_score|
    if current_score <= 21 && (current_score > score)
      score = current_score
    end
  end

  score
end

# find all possible scores recursively
def find_scores(cards, current_score)
  # end case, no more cards left to score
  until cards.empty? do
    current_card = cards.pop

    # recurse if ace, one score for value of one
    # one score for value of eleven
    if current_card == 'A'
      find_scores(cards.dup, current_score + 1)
      current_score += 11
    elsif 'JQK'.include?(current_card)
      current_score += 10
    else
      current_score += current_card.to_i
    end
  end

  @scores << current_score
end
