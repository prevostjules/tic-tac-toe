class Party < ApplicationRecord
  belongs_to :user
  has_many :cells

  enum winner: { pending: 3, user: 1, computer: 3 }
end
