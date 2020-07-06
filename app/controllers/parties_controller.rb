class PartiesController < ApplicationController

  before_action :set_party, only: [:show]

  def show
    @cells = @party.cells.sort
    symbols = []
    @cells.each do |cell|
      symbols << cell.symbol
    end
    winner = check_winning
    if !winner.nil?
      if winner == "cross"
        @winner = current_user
        @party.update!(winner: "user")
      elsif winner == "circle"
        @winner = "computer"
        @party.update!(winner: "computer")
      elsif !symbols.include?("start")
        @winner = "equality"
        @party.update!(winner: "equality")
      end
    end
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

  def check_winning
    array_of_symbols = create_arrays
    winner = ""
    array_of_symbols.each do |array|
      if array.uniq.length == 1
        winner = array[0]
      end
      winner
    end
    winner
  end

  def create_arrays
    symbols_first_row = []
    @cells.first(3).each do |cell|
      symbols_first_row << cell.symbol
    end

    symbols_second_row = []
    @cells[3..5].each do |cell|
      symbols_second_row << cell.symbol
    end

    symbols_third_row = []
    @cells[6..8].each do |cell|
      symbols_third_row << cell.symbol
    end

    symbols_first_column = []
    @cells.values_at(0,3,6).each do |cell|
      symbols_first_column << cell.symbol
    end

    symbols_second_column = []
    @cells.values_at(1,4,7).each do |cell|
      symbols_second_column << cell.symbol
    end

    symbols_third_column = []
    @cells.values_at(2,5,8).each do |cell|
      symbols_third_column << cell.symbol
    end

    symbols_first_diag = []
    @cells.values_at(0,4,8).each do |cell|
      symbols_first_diag << cell.symbol
    end

    symbols_second_diag = []
    @cells.values_at(2,4,6).each do |cell|
      symbols_second_diag << cell.symbol
    end

    [symbols_first_row, symbols_second_row, symbols_third_row, symbols_first_column, symbols_second_column, symbols_third_column, symbols_first_diag, symbols_second_diag]
  end

end
