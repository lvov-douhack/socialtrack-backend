# == Schema Information
#
# Table name: stat_records
#
#  id          :integer          not null, primary key
#  user_id     :integer          not null
#  networkname :string(255)      not null
#  seconds     :integer          not null
#  created_at  :datetime         not null
#

class StatRecord < ActiveRecord::Base

  def self.for_time time
    case time
    when :hour
      period   = 1.hour.ago..Time.now
      period_s = 1.hour.seconds
    when :month
      period   = 1.month.ago..Time.now
      period_s = 1.month.seconds
    else
      period   = 1.day.ago..Time.now
      period_s = 1.day.seconds
    end
    StatRecord.where(created_at: period).group(:networkname).select([
      :networkname,
      "SUM(seconds) AS seconds",
      "SUM(seconds) / #{period_s}.0 * 100 AS percent",
    ])
  end

end
