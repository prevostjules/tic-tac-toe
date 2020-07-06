class AddSymbol2ToCells < ActiveRecord::Migration[6.0]
  def change
    add_column :cells, :symbol, :integer, default: 0
  end
end
