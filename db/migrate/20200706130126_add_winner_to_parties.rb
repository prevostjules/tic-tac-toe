class AddWinnerToParties < ActiveRecord::Migration[6.0]
  def change
    add_column :parties, :winner, :integer, default: 3
  end
end
