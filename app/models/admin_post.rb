class AdminPost < ApplicationRecord
  enum data: {
    elevator: 0,
    wc: 1,
    slope: 2
  }
  def self.search()
  end
end
