module GambleService
  extend self

  def play(bet)
    play_result = throw_coin
    prize = 0

    if bet['coin_side'] == play_result
      prize = 50
    else
      prize = -50
    end

    handle_prize(bet, prize)
    save_bet_history(bet, play_result)
  end

  def bet_history
    Bet.last(5)
  end

  private

  def throw_coin
    rand(2)
  end

  def handle_prize(bet, prize)
    player_funds_to_update = bet['player'].wallet.funds + prize
    bet['player'].wallet.update!(funds: player_funds_to_update)
  end

  def save_bet_history(bet, play_result)
    bet_history = Bet.new
    bet_history.play_result = play_result
    bet_history.player_id = bet['player'].id
    bet_history.save
  end
end
