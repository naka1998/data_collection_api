class AdminPost < ApplicationRecord
  enum data: {
    elevator: 0,
    wc: 1,
    slope: 2
  }

  belongs_to :station
  def self.search(params)
    year = params[:year].to_i
    month = params[:month].present? ? params[:month].to_i : 0
    day = params[:day].present? ? params[:day].to_i : 0
    result = AdminPost.all
    result =if month != 0
              if day != 0
                result.where(created_at: Date.new(year,month,day).in_time_zone.all_day)
              else
                result.where(created_at: Date.new(year,month,1).in_time_zone.all_month)
              end
            else
              result.where(created_at: Date.new(year, 1, 1).in_time_zone.all_year)
            end
    result
  end
end
