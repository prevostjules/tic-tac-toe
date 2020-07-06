class Cell < ApplicationRecord
  belongs_to :party

  enum symbol: { none: 0, cross: 1, circle: 2 }, default: :none
end
