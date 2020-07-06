class RemoveWinFromParties < ActiveRecord::Migration[6.0]
  def change
    remove_column :parties, :win, :string
  end
end
