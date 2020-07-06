class AddPartyIdToCells < ActiveRecord::Migration[6.0]
  def change
    add_reference :cells, :party, null: false, foreign_key: true
  end
end
