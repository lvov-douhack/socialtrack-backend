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

#  def for_time time
#    case time
#    when :hour
#      period = 1.hour.ago..Time.now
#    when :month
#      period = 1.month.ago..Time.now
#    else
#      period = 1.day.ago..Time.now
#    end
    #StatRecord.where(
#  end

end
