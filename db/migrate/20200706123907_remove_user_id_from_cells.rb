class RemoveUserIdFromCells < ActiveRecord::Migration[6.0]
  def change
    remove_column :cells, :user_id, :string
  end
end
