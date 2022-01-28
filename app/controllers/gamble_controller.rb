class GambleController < ApplicationController
  def index
    @player = Player.first
    @bet_history = GambleService.bet_history
  end

  def play
    bet = {
      'player' => Player.first,
      'coin_side' => params[:coin_side].to_i,
      'money_gambled' => params[:money_gambled].to_f
    }

    GambleService.play(bet)
    redirect_to '/'
  end
end
