class CheckList < ApplicationRecord
  belongs_to :routine
  has_many :check_items
end
