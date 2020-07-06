class PartiesController < ApplicationController

  before_action :set_party, only: [:show]

  def show
    @cells = @party.cells
  end

  def create
    @party = Party.new(user: current_user)
    @cells = create_cells
    if @party.save!
      redirect_to party_path(@party)
    end
  end

  private

  def set_party
    @party = Party.find(params[:id])
  end

  def create_cells
    cells = []
    9.times do
      cell = Cell.new(party: @party, symbol: "start")
      cell.save!
      cells << cell
    end
    cells
  end

end
