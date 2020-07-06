class CellsController < ApplicationController
  before_action :set_cell, only: [:update]


  def update
    @party = @cell.party
    @cell.update!(symbol: "cross")
    computer_choice = computer_revolutionary_ia
    computer_choice.update(symbol: "circle")
    redirect_to party_path(@party)
  end

  private

  def set_cell
    @cell = Cell.find(params[:id])
  end

  def computer_revolutionary_ia
    empty_cells = @party.cells.select{ |cell| cell.symbol == "start"}
    empty_cells.sample
  end
end
