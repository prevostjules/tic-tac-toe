class Party < ApplicationRecord
  belongs_to :user
  has_many :cells

  enum win: { user: 0, computer: 1, none: 2 }
end
