class AddSymbolToCells < ActiveRecord::Migration[6.0]
  def change
    add_column :cells, :symbol, :integer
  end
end
