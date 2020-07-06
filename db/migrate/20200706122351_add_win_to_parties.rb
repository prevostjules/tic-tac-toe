class AddWinToParties < ActiveRecord::Migration[6.0]
  def change
    add_column :parties, :win, :integer
  end
end
