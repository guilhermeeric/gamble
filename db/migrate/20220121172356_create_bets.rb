class CreateBets < ActiveRecord::Migration[7.0]
  def change
    create_table :bets do |t|
      t.bigint :play_result

      t.timestamps
    end
  end
end
