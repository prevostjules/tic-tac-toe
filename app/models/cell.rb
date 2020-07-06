class Cell < ApplicationRecord
  belongs_to :party

  enum symbol: { start: 0, cross: 1, circle: 2 }
end
