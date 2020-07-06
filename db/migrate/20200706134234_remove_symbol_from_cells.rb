class RemoveSymbolFromCells < ActiveRecord::Migration[6.0]
  def change
    remove_column :cells, :symbol, :string
  end
end
